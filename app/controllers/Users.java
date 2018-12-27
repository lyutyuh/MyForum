package controllers;

import java.util.*;

import models.*;

public class Users extends Application {

    public static void index(Integer page) {
        List users = User.findAll(page == null ? 1 : page, pageSize);
        Long nbUsers = User.count();
        Long exists = User.countExist();
        render(nbUsers, exists, users, page);
    }

    public static void searchResult(String name) {        
        List result = User.find("select u from User u where u.name=?1 and u.deleted=0", name).fetch();
        
        for(Object u:result){
            User uu = (User) u;
            System.out.println(uu.name);
            System.out.println(uu.id);
        }
        Long nbUsers = (long)result.size();
        render(nbUsers, result);
    }

    public static void showXML(Long id) {    
        User user = User.findById(id);
        render(user);
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
        flash.success("这个用户已被删除。");
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
        flash.success("这个用户被任命为版主！");
        index(null);

    }
}
