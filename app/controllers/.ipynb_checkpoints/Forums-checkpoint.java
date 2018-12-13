package controllers;

import java.util.*;

import play.data.validation.*;

import models.*;

public class Forums extends Application {

    public static void index() {
        List forums = Forum.findAll();
        List topics_byViews = Topic.find("order by views desc").fetch(10);

        List topics_byReplies = Topic.find("select t from Post p, Topic t where p.topic.id = t.id group by t.id order by count(distinct p.id) desc").fetch(10);

        long topicsCount = Topic.countExist();
        long postsCount = Post.countExist();
        long forumCount = Forum.countExist();
        render(forums, topicsCount, postsCount, forumCount, topics_byViews, topics_byReplies);
    }

    @Secure(admin = true)
    public static void create(@Required String name, String description) {
        if (validation.hasErrors()) {
            validation.keep();
            params.flash();
            flash.error("Please correct these errors !");
            index();
        }
        Forum forum = new Forum(name, description);
        forum.save();
        index();
    }

    public static void show(Long forumId, Integer page) {
        Forum forum = Forum.findById(forumId);
        notFoundIfNull(forum);        
        String banzhuName = "";
        if (forum.banzhuId == -1){
            banzhuName = "This forum has no Banzhu yet.";
        }else{
            User u = User.findById(forum.banzhuId);
            banzhuName = "Banzhu of this forum is " + u.name + ".";
        }
        render(forum, page, banzhuName);
    }

    @Secure
    public static void delete(Long forumId) {
        Forum forum = Forum.findById(forumId);
        notFoundIfNull(forum);
        if(forum.banzhuId != -1){
            User banzhu = User.findById(forum.banzhuId);
            banzhu.resign();
            forum.dismissBanzhu();
        }        
        forum.delete();
        flash.success("The forum has been deleted");
        index();
    }


    @Secure
    public static void modify(Long forumId, String ChangeName) {
        Forum forum = Forum.findById(forumId);
        notFoundIfNull(forum);
        forum.name = ChangeName;
        forum.save();
        flash.success("The forum has been modified");
        index();
    }
}

