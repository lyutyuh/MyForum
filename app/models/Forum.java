package models;

import javax.persistence.*;
import java.util.*;

import play.db.jpa.*;
import play.data.validation.*;

@Entity
public class Forum extends Model {

    @Required
    public String name;
    public String description;
    public Long banzhuId;
    public boolean deleted;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "forum")
    public List<Topic> topics;
    

    // ~~~~~~~~~~~~ 
    
    public Forum(String name, String description) {
        this.name = name;
        this.description = description;
        this.banzhuId = (long) -1;
        this.deleted = false;
        create();
    }
    
    // ~~~~~~~~~~~~ 
    
    public Forum delete(){
        this.deleted = true;
        save();
        return this;
    }
    public Topic newTopic(User by, String subject, String content) {
        Topic t = new Topic(this, by, subject, content);
        this.refresh();
        return t;
    }
    
    public void assignBanzhu(User user){
        Long userid = user.id;        
        this.banzhuId = userid;
        save();
        return;        
    }
    
    public void dismissBanzhu(){
        this.banzhuId = (long) -1;
        System.out.println(this.banzhuId);
        this.save();
        return;
    }
    
    // ~~~~~~~~~~~~ 
    
    public long getTopicsCount() {
        long tmp = 0;
        List<Topic> t_list = Topic.find("forum", this).fetch();
        for(Topic t:t_list){
            if(!t.deleted){
                tmp += 1;
            }
        }
        return tmp;
    }

    public long getPostsCount() {        
        long tmp = 0;
        List<Post> t_list = Post.find("topic.forum", this).fetch();
        for(Post t:t_list){
            if(!t.topic.deleted){
                tmp += 1;
            }
        }
        return tmp;     
    }

    public List<Topic> getTopics(int page, int pageSize) {
        return Topic.find("forum", this).fetch(page, pageSize);
    }
    
    public List<User> getAllRepliedUsers(){
        return User.find("select u from User u, Post p where p.topic.forum=?1 and p.topic.postedBy=u and not p.deleted=1 and not u.deleted=1 group by u.id order by count(distinct p.id) desc", this).fetch();
    }
    
    public List<User> getAllPostedUsers(){
        return User.find("select u from User u, Post p where p.topic.forum=?1 and p.postedBy=u and not p.deleted=1 and not u.deleted=1  group by u.id order by count(distinct p.id) desc", this).fetch();
    }

    // TODO CHECK
    public List<User> getActiveUsersByPost() {
        return User.find("select u from User u, Post p where p.topic.forum=?1 and p.postedBy=u and not p.deleted=1 and not u.deleted=1  group by u.id order by count(distinct p.id) desc", this).fetch(10);
    }
    
    

    public List<Long> getUsersPostnum() {
        return User.find("select count(distinct p.id) from User u, Post p where p.topic.forum=?1 and p.postedBy=u and not p.deleted=1 and not u.deleted=1  group by u.id order by count(distinct p.id) desc", this).fetch();
    }
    
    public List<Long> getUsersReplnum() {
        return User.find("select count(distinct p.id) from User u, Post p where p.topic.forum=?1 and p.topic.postedBy=u and not p.deleted=1 and not u.deleted=1  group by u.id order by count(distinct p.id) desc", this).fetch();
    }
    
    public Long getAverageReplnum(){
        List <Long> allPostnum = getUsersReplnum();
        Long ans = (long) 0;
        
        for (Long lll:allPostnum){
            ans += lll;
        }
        ans /= allPostnum.size();
        return ans;
    }
    
    public Long getAveragePostnum(){
        List <Long> allPostnum = getUsersPostnum();
        Long ans = (long) 0;
        for (Long lll:allPostnum){
            ans += lll;
        }
        ans /= allPostnum.size();
        return ans;
    }
    
    public List <User> getAboveAverageUser(){
        List <User> tmp = getAllRepliedUsers();
        List <Long> tmp_len = getUsersReplnum();
        
        List <User> toret=new ArrayList<>();
        
        Long avg = getAveragePostnum();
        for (int i=0;i<tmp.size();++i){
            if (tmp_len.get(i) > avg){
                toret.add(tmp.get(i));
            }
        }
        return toret;
    }
    
    public Topic getHottestTopic(){
        // Topic tmp = Topic.find("select t from Topic t where t.forum=?1 and not t.deleted=1 order by max(select p.postedAt from t, Post p where p.topic=?1) desc", this).first();
        List <Topic> tmp = Topic.findAll();
        Topic ans = null;
        Long diff = (long) 0;
        for (Topic t:tmp){            
            if(t.forum.id==this.id){
                Long sth = t.hotness();
                if( (!t.deleted && sth > diff) || diff==0){
                    diff = sth;
                    ans = t;
                }
            }
        }
        return ans;
    }

    public List<Topic> getAboveAverageViewTopic(){
        List <Topic> tmp = Topic.find("select t from Topic t where t.forum=?1 and not t.deleted=1 order by t.views desc", this).fetch();
        List <Integer> tmp_len = Topic.find("select t.views from Topic t where t.forum=?1 and not t.deleted=1 order by t.views desc", this).fetch();
        
        Long avg = (long) 0;
        for(int i = 0;i < tmp_len.size();++i){
            avg += (long) tmp_len.get(i);            
        }
        avg /= tmp_len.size();
        
        List <Topic> toret = new ArrayList<>();
        for(int i = 0;i < tmp_len.size();++i){
            if(tmp_len.get(i) > avg){
                toret.add(tmp.get(i));
            }
        }
        return toret;
        
    }

    public Post getLastPost() {
        return Post.find("topic.forum = ?1 order by postedAt desc", this).first();
    }


    public Long postsOf(Long userId){
        Long tmp = (long) 0;
        for(Topic t:this.topics){
            for(Post p:t.posts){
                if(p.postedBy.id == userId){
                    tmp += 1;
                }
            }
        }
        return tmp;
    }
    
    

    public Long repliesOf(Long userId){
        Long tmp = (long) 0;
        for(Topic t:this.topics){
            for(Post p:t.posts){
                if(p.topic.postedBy.id == userId){
                    tmp += 1;
                }
            }
        }
        return tmp;
    }
    
    // ~~~~~~~~~~~~~~~~
    public static long countExist(){
        long tmp = 0;
        List<Forum> t_list = Forum.all().fetch();
        for(Forum u: t_list){
            if (!u.deleted){
                tmp += 1;
            }
        }
        return tmp;
    }
    
}

