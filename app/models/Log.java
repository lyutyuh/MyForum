package models;

import javax.persistence.*;
import java.util.*;

import play.data.binding.*;

import play.db.jpa.*;


@Entity
@Table(name = "Log")
public class Log extends Model
{
    public Date log_created_time;
    public Long user_id;
}