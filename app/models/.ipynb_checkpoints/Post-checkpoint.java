package models;

import javax.persistence.*;
import java.util.*;

import play.data.binding.*;

import play.db.jpa.*;

@Entity
public class Post extends Model {

    public String content;
    
    @As("yyyy-MM-dd")
    public Date postedAt;
    
    @OneToOne
    public User postedBy;
    
    @ManyToOne
    public Topic topic;

    public long likes;
    public boolean deleted;
    
    @ManyToMany(cascade = CascadeType.ALL)
    public List<User> whoLiked; // user id in list
    
    // ~~~~~~~~~~~~ 
    
    public Post(Topic topic, User postedBy, String content) {
        this.topic = topic;
        this.postedBy = postedBy;
        this.content = content;
        this.likes = 0;
        this.postedAt = new Date();
        this.deleted = false;
        create();
    }
    
    // ~~~~~~~~~~~~
    
    public Post delete(){
        this.deleted = true;
        save();
        return this;
    }
    
    public void liked(User userLiked){
        for(User u: this.whoLiked){
            System.out.println(u.id);
            if (u.id == userLiked.id){
                return;
            }
        }        
        this.whoLiked.add(userLiked);
        this.likes = this.whoLiked.size();
        save();
        return;
    }
    // ~~~~~~~~~~~~~~    
    public static long countExist(){
        long tmp = 0;
        List<Post> t_list = Post.all().fetch();
        for(Post u: t_list){
            if (!u.deleted){
                tmp += 1;
            }
        }
        return tmp;
    }
    
    
}

