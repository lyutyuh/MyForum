package controllers;

import java.util.*;

import play.data.validation.*;

import models.*;

public class Forums extends Application {


    public static void index(int comparing, Long Aid, Long Bid) {
        if (comparing == 0){

            List forums = Forum.findAll();
            List topics_byViews = Topic.find("order by views desc").fetch(10);
    
            List topics_byReplies = Topic.find("select t from Post p, Topic t where p.topic.id = t.id group by t.id order by count(distinct p.id) desc").fetch(10);
    
            long topicsCount = Topic.countExist();
            long postsCount = Post.countExist();
            long forumCount = Forum.countExist();
            render(forums, topicsCount, postsCount, forumCount, topics_byViews, topics_byReplies);
        }
        else{
            List forums = Forum.findAll();
            List topics_byViews = Topic.find("order by views desc").fetch(10);

            List topics_byReplies = Topic.find("select t from Post p, Topic t where p.topic.id = t.id group by t.id order by count(distinct p.id) desc").fetch(10);


            long topicsCount = Topic.countExist();
            long postsCount = Post.countExist();
            long forumCount = Forum.countExist();

            Forum fa = Forum.findById(Aid);
            Forum fb = Forum.findById(Bid);

            List <User> faPostUser = fa.getAllPostedUsers();
            List <Long> faPostNum  = fa.getUsersPostnum();
            List <User> fbPostUser = fb.getAllPostedUsers();
            List <Long> fbPostNum  = fb.getUsersPostnum();

            List <User> compres = new ArrayList<>();
            for(int i = 0;i<faPostNum.size();i++){
                boolean inB = false;
                for(int j = 0;j<fbPostNum.size();j++){
                    if(faPostUser.get(i).id == fbPostUser.get(j).id){
                        inB = true;
                        if(faPostNum.get(i) > fbPostNum.get(j)){
                            compres.add(faPostUser.get(i));
                            break;
                        }                    
                    }
                }
                if(!inB){
                    compres.add(faPostUser.get(i));
                }
            }
            render(forums, topicsCount, postsCount, forumCount, topics_byViews, topics_byReplies, compres, fa, fb);
        }
    }





    @Secure(admin = true)
    public static void create(@Required String name, String description) {
        if (validation.hasErrors()) {
            validation.keep();
            params.flash();
            flash.error("Please correct these errors !");
            index(0, null, null);
        }
        Forum forum = new Forum(name, description);
        forum.save();
        index(0, null, null);
    }

    public static void show(Long forumId, Integer page) {
        Forum forum = Forum.findById(forumId);
        notFoundIfNull(forum);        
        String banzhuName = "";
        if (forum.banzhuId == -1){
            banzhuName = "这个版块还没有版主";
        }else{
            User u = User.findById(forum.banzhuId);
            banzhuName = "这个板块的版主是 " + u.name;
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
        index(0, null, null);
    }


    @Secure
    public static void modify(Long forumId, String ChangeName) {
        Forum forum = Forum.findById(forumId);
        notFoundIfNull(forum);
        forum.name = ChangeName;
        forum.save();
        flash.success("The forum has been modified");
        index(0, null, null);
    }
}

