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

    class postInfo{

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

        public postInfo(Topic t){
            this.no = t.id;
            this.forum = t.forum.name;
            this.subject = t.subject;
            this.time = t.postedAt.toGMTString();
            this.views = t.views;
            this.replies = t.getPostsCount();

        }

    }

    @XmlElementWrapper(name = "Posts")
    @XmlElement(name="Post")
    List<postInfo> pi;


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


    public reducedUser(User u){
        bi = new basicInfo(u);
        pi = new ArrayList<>();
        ri = new ArrayList<>();

        List<Topic> allTopics = Topic.findAll();
        for(Topic t: allTopics){
            if(t.postedBy.id == u.id){
                this.pi.add(new postInfo(t));
            }
        }

        List<Post> allPosts = Post.findAll();
        for(Post p: allPosts){
            if(p.topic.postedBy.id == u.id){
                this.ri.add(new replyInfo(p));
            }
        }



    }



    // ~~~~~~~~~~~~~~~~~
    public static int getDiffYears(Date first, Date last) {

        return (first.getYear() - last.getYear());
    }

}
