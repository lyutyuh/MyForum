package models;

import javax.persistence.*;
import java.util.*;

import play.db.jpa.*;
import play.data.validation.*;
import play.data.binding.*;

@Entity
public class Topic extends Model {

    @Required
    public String subject;
    
    public Integer views = 0;
    
    @ManyToOne
    public Forum forum;

    @As("yyyy-MM-dd")
    public Date postedAt;

    @OneToOne
    public User postedBy;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "topic")
    public List<Post> posts;
    
    public boolean deleted;
    
    // ~~~~~~~~~~~~ 
    
    public Topic(Forum forum, User by, String subject, String content) {
        this.forum = forum;
        this.deleted = false;
        this.subject = subject;
        this.postedAt = new Date();
        this.postedBy = by;
        create();
        new Post(this, by, content);
    }
    
    
    // ~~~~~~~~~~~~ 
    
    public Post reply(User by, String content) {
        System.out.println(JPA.getDBName(this.getClass()));
        return new Post(this, by, content);
    }
    
    public Topic delete(){
        this.deleted = true;
        for (Post p: posts){
            p.delete();
        }
        save();
        return this;
    }
    
    
    // ~~~~~~~~~~~~~~~
    public List<Post> getPosts(int page, int pageSize) {
        return Post.find("topic", this).fetch(page, pageSize);
    }
    
    public Long hotness(){
        Long diff = (long) 0;
        for(Post p:this.posts){
            if (p.postedAt.getTime() - this.postedAt.getTime() > diff){
                diff = p.postedAt.getTime() - this.postedAt.getTime();
            }
        }
        return diff;
    }

    public Long getPostsCount() {
        return Post.count("topic", this);
    }

    public Long getVoicesCount() {
        return User.count("select count(distinct u) from User u, Topic t, Post p where p.postedBy = u and p.topic = t and t = ?1", this);
    }

    public Post getLastPost() {
        return Post.find("topic = ?1 order by postedAt desc", this).first();
    }
    
    //~~~~~~~~~~~~~    
    public static long countExist(){
        long tmp = 0;
        List<Topic> t_list = Topic.all().fetch();
        for(Topic u: t_list){
            if (!u.deleted){
                tmp += 1;
            }
        }
        return tmp;
    }

}

