package models;

import javax.persistence.*;
import java.util.*;
import java.io.StringWriter;

import play.*;
import play.db.jpa.*;
import play.libs.*;
import play.data.validation.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;




@Entity
public class User extends Model {

    @Email
    @Required
    public String email;
    
    @Required
    public String passwordHash;
    
    @Required
    public String name;
    
    public String needConfirmation;

    /* custom field */
    public Long level;
    public Long age;
    public String gender;

    public Date registrationDate; 
    public Date dateOfBirth;

    public boolean isBanzhu;
    public Long isBanzhuOf;
    
    public boolean deleted;
    
    
    // ~~~~~~~~~~~~ 
    
    public User(String email, String password, String name, Date dateOfBirth, String gender) {
        this.email = email;
        this.passwordHash = Codec.hexMD5(password);
        this.name = name;
        this.needConfirmation = Codec.UUID();
        this.registrationDate = new Date();
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.isBanzhu = false;
        this.isBanzhuOf = (long) -1;
        this.deleted = false;
        create();
    }
    
    // ~~~~~~~~~~~~ 
    
    public User delete(){
        this.deleted = true;
        return this;
    }
    
    public boolean checkPassword(String password) {
        return passwordHash.equals(Codec.hexMD5(password));
    }

    public boolean isAdmin() {
        return email.equals(Play.configuration.getProperty("forum.adminEmail", ""));
    }
    
    public void promoteToBanzhu(Forum forum){
        Long forumId = forum.id;
        this.isBanzhu = true;
        this.isBanzhuOf = forum.id;
        save();
        return;
    }
    
    public void resign(){
        this.isBanzhu = false;
        this.isBanzhuOf = (long) -1;
        save();
        return;
    }
    
    // ~~~~~~~~~~~~ 
    
    public List<Post> getRecentsPosts() {
        return Post.find("postedBy = ?1 order by postedAt", this).fetch(1, 10);
    }

    public Long getPostsCount() {
        return Post.count("postedBy", this);
    }

    public Long getTopicsCount() {
        return Post.count("select count(distinct t) from Topic t, Post p, User u where p.postedBy = ?1 and p.topic = t", this);
    }
    
    public String getSupervisedForum(){
        if (this.isBanzhuOf != -1){
            Forum f = Forum.findById(this.isBanzhuOf);
            return f.name;
        }
        else{
            return "None";
        }
    }

    public String toXML(){
        reducedUser rdu = new reducedUser(this);
        try {            
            JAXBContext jaxbContext = JAXBContext.newInstance(reducedUser.class);
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            StringWriter sw = new StringWriter();
            jaxbMarshaller.marshal(rdu, sw);
            String xmlString = sw.toString();
            return xmlString;
            
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("user to xml failed");
        }
        return "failed generating xml.../n";
 
    }


    
    // ~~~~~~~~~~~~ 
    
    public static User findByEmail(String email) {
        return find("email", email).first();
    }

    public static User findByRegistrationUUID(String uuid) {
        return find("needConfirmation", uuid).first();
    }

    public static List<User> findAll(int page, int pageSize) {
        return User.all().fetch(page, pageSize);
    }

    public static boolean isEmailAvailable(String email) {
        return findByEmail(email) == null;
    }
    
    public static long countExist(){
        long tmp = 0;
        List<User> t_list = User.all().fetch();
        for(User u: t_list){
            if (!u.deleted){
                tmp += 1;
            }
        }
        return tmp;
    }


    
}

