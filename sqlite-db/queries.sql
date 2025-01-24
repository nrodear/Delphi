DROP TABLE person;
CREATE TABLE person (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 firstname varchar(200) NOT NULL,
 lastname varchar(200) NOT NULL,
 domicile varchar(200)
 );

INSERT INTO person (firstname,lastname,domicile)
VALUES ("Nic","Gerlach","Bremen");

SELECT * FROM person;
 