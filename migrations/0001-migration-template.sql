/**
 * Migration Description: 
 *
 * FILL IN HERE 
 * 
 * Rollback Instructions: 
 *
 * FILL IN HERE
 * 
 */

DROP PROCEDURE IF EXISTS RunMigration;

DELIMITER $$

CREATE PROCEDURE RunMigration()
BEGIN
	IF EXISTS(SELECT * FROM schema_migration WHERE filename=@SCRIPTNAME) THEN
	  select CONCAT(@SCRIPTNAME, ' has already been ran') AS '';
	ELSE
	  select CONCAT(@SCRIPTNAME, ' is running') AS '';
    /* PUT YOUR MIGRATION SCRIPT HERE - START */



	  /* PUT YOUR MIGRATION SCRIPT HERE - END */
    INSERT INTO schema_migration(filename) VALUES(@SCRIPTNAME);
    select CONCAT(@SCRIPTNAME, ' was run successfully') AS '';
	END IF;
END $$

DELIMITER ;

CALL RunMigration();
