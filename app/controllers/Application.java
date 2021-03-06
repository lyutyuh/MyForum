package controllers;

import play.*;
import play.mvc.*;
import play.data.validation.*;

import models.*;
import notifiers.*;

import javax.persistence.*;
import java.util.*;

import play.db.jpa.*;
import play.libs.*;


public class Application extends Controller {

    static Integer pageSize = Integer.parseInt(Play.configuration.getProperty("forum.pageSize", "10"));
    
    // ~~~~~~~~~~~~ @Before interceptors
    
    @Before
    static void globals() {
        renderArgs.put("connected", connectedUser());
        renderArgs.put("pageSize", pageSize);
    }

    @Before
    static void checkSecure() {
        Secure secure = getActionAnnotation(Secure.class);
        if (secure != null) {
            if (connectedUser() == null || (secure.admin() && !connectedUser().isAdmin())) {
                forbidden();
            }
        }
    }
    // ~~~~~~~~~~~~ Actions
    
    public static void signup() {
        render();
    }

    public static void register(@Required @Email String email, 
                                @Required @MinSize(5) String password, 
                                @Equals("password") String password2, 
                                @Required String name, 
                                @Required Date dateOfBirth, 
                                @Required String gender) {
        if (validation.hasErrors()) {
            validation.keep();
            params.flash();
            flash.error("Please correct these errors !");
            signup();
        }
        User user = new User(email, password, name, dateOfBirth, gender);
        try {
            if (Notifier.welcome(user)) {
                flash.success("Your account is created. Please check your emails ...");                
                login();
            }
        } catch (Exception e) {
            Logger.error(e, "Mail error");
        }
        flash.error("Oops ... (the email cannot be sent)");
        login();
    }

    public static void confirmRegistration(String uuid) {
        User user = User.findByRegistrationUUID(uuid);
        notFoundIfNull(user);
        user.needConfirmation = null;
        user.save();
        connect(user);
        flash.success("Welcome %s !", user.name);
        Users.show(user.id);
    }

    public static void login() {
        render();
    }

    public static void searchUser(String name){
        Users.searchResult(name);
    }

    public static void authenticate(String email, String password) {
        User user = User.findByEmail(email);
        if (user == null || !user.checkPassword(password)) {
            flash.error("账号或密码错误");
            flash.put("email", email);
            login();
        } else if (user.needConfirmation != null) {
            flash.error("账号未验证");
            flash.put("notconfirmed", user.needConfirmation);
            flash.put("email", email);
            login();
        } else if (user.deleted){
            flash.error("此账号已经被删除！");
            login();
        }
        
        connect(user);
        flash.success("Welcome back %s !", user.name);
        Users.show(user.id);
    }

    public static void logout() {
        flash.success("You've been logged out");
        session.clear();
        Forums.index(0, null, null);
    }

    public static void resendConfirmation(String uuid) {
        User user = User.findByRegistrationUUID(uuid);
        notFoundIfNull(user);
        try {
                confirmRegistration(uuid);
                login();
            
        } catch (Exception e) {
            Logger.error(e, "Mail error");
        }
        flash.error("Oops (the email cannot be sent)...");
        flash.put("email", user.email);
        login();
    }

    public static void compareAB(Long Aid, Long Bid){
        if(Aid == null || Bid==null){
            Aid = (long)1;
            Forums.index(0 , Aid, Bid);
        }     
        
        Forums.index(1, Aid, Bid);
        return;
    }
    
    // ~~~~~~~~~~~~ Some utils
    
    static void connect(User user) {
        session.put("logged", user.id);
    }

    static User connectedUser() {
        String userId = session.get("logged");
        return userId == null ? null : (User) User.findById(Long.parseLong(userId));
    }



}