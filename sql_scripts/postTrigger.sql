DROP TRIGGER IF EXISTS posttrigger;
DROP TABLE IF EXISTS Log;
CREATE TABLE Log(log_created_time datetime, user_id INTEGER, id INTEGER);
DELIMITER ||
CREATE TRIGGER posttrigger AFTER INSERT ON Post 
	FOR EACH ROW
		BEGIN
			SET @recenttenmin := (SELECT COUNT(*) FROM Post as p
									WHERE p.postedAt >= (NOW() - INTERVAL 10 MINUTE)
									AND p.postedBy_id=NEW.postedBy_id);
			IF (@recenttenmin >= 3) THEN
				INSERT INTO Log VALUES(NOW(), NEW.postedBy_id, 0);
			END IF;				
		END
		||
DELIMITER ;
