package models;

import javax.xml.bind.*;

import javax.persistence.*;
import java.util.*;
import java.io.StringWriter;

import java.util.Calendar;
import java.util.Locale;
import java.util.Calendar.*;
import java.util.Date;




import play.*;
import play.db.jpa.*;
import play.libs.*;
import play.data.validation.*;

import javax.xml.bind.annotation.*;

@XmlRootElement(name="User")
public class reducedUser{
    class basicInfo{
        @XmlElement
        long id;

        @XmlElement(name="Name")
        String name;

        @XmlElement(name="Gender")
        String gender;

        @XmlElement(name="RegistrationDate")
        String registrationDate; 

        @XmlElement(name="Birthday")
        String dateOfBirth;

        @XmlElement(name="Age")
        int age;

        @XmlElement(name="Level")
        int level;

        basicInfo(User u){
            this.id = u.id;
            this.name = u.name;
            this.gender = u.gender;

            this.dateOfBirth = u.dateOfBirth.toGMTString();
            this.registrationDate = u.registrationDate.toGMTString(); 

            this.age = getDiffYears(new Date(), u.dateOfBirth);

            this.level = (int) (long) u.getPostsCount()/10;
        }

    }   

    @XmlElement(name="BasicInfo")
    basicInfo bi;

    class topicInfo{

        @XmlElement
        long no;

        @XmlElement(name="Forum")
        String forum;

        @XmlElement(name="Subject")
        String subject;

        @XmlElement(name="Time")
        String time; 

        @XmlElement(name="ReplyNum")
        Long replies;

        @XmlElement(name="Views")
        int views;

        public topicInfo(Topic t){
            this.no = t.id;
            this.forum = t.forum.name;
            this.subject = t.subject;
            this.time = t.postedAt.toGMTString();
            this.views = t.views;
            this.replies = t.getPostsCount();

        }

    }

    @XmlElementWrapper(name = "Topics")
    @XmlElement(name="Topic")
    List<topicInfo> ti;


    class replyInfo{

        @XmlElement
        long no;

        @XmlElement(name="Forum")
        String forum;

        @XmlElement(name="Topic")
        String topic;

        @XmlElement(name="Replier")
        String replier;

        @XmlElement(name="Content")
        String content;

        @XmlElement(name="Time")
        String time; 

        @XmlElement(name="Likes")
        Long likes;

        public replyInfo(Post p){
            this.no = p.id;
            this.forum = p.topic.forum.name;
            this.topic = p.topic.subject;
            this.replier = p.postedBy.name;
            this.content = p.content;
            this.time = p.postedAt.toGMTString();
            this.likes = p.likes;
        }

    }

    @XmlElementWrapper(name = "Replies")
    @XmlElement(name="Reply")
    List<replyInfo> ri;





    class postsInfo{

        @XmlElement
        long no;

        @XmlElement(name="Forum")
        String forum;

        @XmlElement(name="Topic")
        String topic;

        @XmlElement(name="Content")
        String content;

        @XmlElement(name="Time")
        String time; 

        @XmlElement(name="Likes")
        Long likes;

        public postsInfo(Post p){
            this.no = p.id;
            this.forum = p.topic.forum.name;
            this.topic = p.topic.subject;            
            this.content = p.content;
            this.time = p.postedAt.toGMTString();
            this.likes = p.likes;
        }

    }

    @XmlElementWrapper(name = "Posts")
    @XmlElement(name="Posted")
    List<postsInfo> pi;


    public reducedUser(User u){
        bi = new basicInfo(u);
        ti = new ArrayList<>();
        ri = new ArrayList<>();
        pi = new ArrayList<>();

        List<Topic> allTopics = Topic.find("select t from Topic t where t.postedBy=?1 and t.deleted=0", u).fetch(); // Topic.find("select t from Topic t where t.postedBy=?1", u)
        for(Topic t: allTopics){
            this.ti.add(new topicInfo(t));
            
        }

        List<Post> allReplies = Post.find("select p from Post p where p.topic.postedBy=?1 and p.deleted=0", u).fetch(); // Post.find("select p from Post p where p.topic.postedBy=?1", u).fetch();
        for(Post p: allReplies){
            this.ri.add(new replyInfo(p));            
        }


        List<Post> allPosts = Post.find("select p from Post p where p.postedBy=?1 and p.deleted=0", u).fetch(); // Post.find("select p from Post p where p.topic.postedBy=?1", u).fetch();
        for(Post p: allPosts){
            this.pi.add(new postsInfo(p));            
        }
    }



    // ~~~~~~~~~~~~~~~~~
    public static int getDiffYears(Date first, Date last) {

        return (first.getYear() - last.getYear());
    }

}
