package controllers;

import java.util.*;

import models.*;

public class Users extends Application {

    public static void index(Integer page) {
        List users = User.findAll(page == null ? 1 : page, pageSize);
        Long nbUsers = User.countExist();
        render(nbUsers, users, page);
    }

    public static void searchResult(String name) {        
        List result = User.find("select u from User u where u.name=?1", name).fetch();
        
        for(Object u:result){
            User uu = (User) u;
            System.out.println(uu.name);
            System.out.println(uu.id);
        }
        Long nbUsers = (long)result.size();
        render(nbUsers, result);
    }

    public static void show(Long id) {
        User user = User.findById(id);
        List forums = Forum.findAll();
        notFoundIfNull(user);

        List<Log> susp_users = Topic.find("select l from Log l").fetch();


        for (int i=0;i<susp_users.size();++i){
            Log lg = susp_users.get(i);
            Date ttt = lg.log_created_time;
            long ddd = (long) lg.user_id;
        }
        
        render(forums, user, susp_users);
    }

    public static void delete(Long id){
        User user = User.findById(id);
        notFoundIfNull(user);
        user.delete();
        user.save();
        flash.success("The user(s) has been deleted!");
        index(null);

    }
    
    public static void promote(Long uid, Long fid){
        // userid, forumid
        System.out.println(uid);
        System.out.println(fid);
        
        User user = User.findById(uid);
        notFoundIfNull(user);
        Forum forum = Forum.findById(fid);
        notFoundIfNull(forum);

        if(user.isBanzhuOf != -1){
            Forum currentForum = Forum.findById(user.isBanzhuOf);
            currentForum.dismissBanzhu();
        }
        
        if(forum.banzhuId != -1){
            User currentBanzhu = User.findById(forum.banzhuId);
            forum.dismissBanzhu();
            currentBanzhu.resign();                                   
        }
        
        user.promoteToBanzhu(forum);
        forum.assignBanzhu(user);
        flash.success("The user has been promoted to Banzhu!");
        index(null);

    }
}
