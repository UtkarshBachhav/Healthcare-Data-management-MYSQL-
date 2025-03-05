CREATE DATABASE TechHospital;

CREATE TABLE Nurse(
   employeeid INTEGER  NOT NULL  
  ,name       VARCHAR(15) NOT NULL
  ,position   VARCHAR(10) NOT NULL
  ,registered VARCHAR(1) NOT NULL
  ,ssn        INTEGER  NOT NULL
);

ALTER TABLE Nurse
ADD CONSTRAINT PRIMARY KEY(employeeid);

INSERT INTO Nurse(employeeid,name,position,registered,ssn) 
VALUES 
(101,'Carla Espinosa','Head Nurse','t',111111110),
(102,'Laverne Roberts','Nurse','t',222222220),
(103,'Paul Flowers','Nurse','f',333333330);


CREATE TABLE Physician(
   employeeid INTEGER  NOT NULL 
  ,name       VARCHAR(17) NOT NULL
  ,position   VARCHAR(28) NOT NULL
  ,ssn        INTEGER  NOT NULL
);

ALTER TABLE Physician
ADD CONSTRAINT PRIMARY KEY(Employeeid);

INSERT INTO Physician(employeeid,name,position,ssn) 
VALUES (1,'John Dorian','Staff Internist',111111111),
(2,'Elliot Reid','Attending Physician',222222222),
(3,'Christopher Turk','Surgical Attending Physician',333333333),
(4,'Percival Cox','Senior Attending Physician',444444444),
(5,'Bob Kelso','Head Chief of Medicine',555555555),
(6,'Todd Quinlan','Surgical Attending Physician',666666666),
(7,'John Wen','Surgical Attending Physician',777777777),
(8,'Keith Dudemeister','MD Resident',888888888),
(9,'Molly Clock','Attending Psychiatrist',999999999);


create table department
(department_id int not null ,
name VARCHAR(17) NOT NULL,
head int not null);


ALTER TABLE department
ADD CONSTRAINT PRIMARY KEY(department_id);

ALTER TABLE department
ADD CONSTRAINT foreign key(department_id) references Physician(employeeid);

insert into department 
values (1,'General Medicine', 4),
(2,'Surgery',7),
(3,'Psychiatry',9);


CREATE TABLE appointment(
   appointmentid   INTEGER  NOT NULL  
  ,patient         INTEGER  NOT NULL
  ,prepnurse       INTEGER 
  ,Physician       INTEGER  NOT NULL
  ,start_dt        date NOT NULL
  ,end_dt	        DATE NOT NULL
  ,examinationroom VARCHAR(1) NOT NULL
);
ALTER TABLE appointment
ADD CONSTRAINT PRIMARY KEY(appointmentid);

ALTER TABLE appointment
ADD CONSTRAINT foreign key(Patient) references patient(ssn);

ALTER TABLE appointment
ADD CONSTRAINT foreign key(prepnurse) references Nurse(employeeid);

ALTER TABLE appointment
ADD CONSTRAINT foreign key(Physician) references Physician(employeeid);

INSERT INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt,end_dt,examinationroom) 
VALUES (13216584,100000001,101,1,'2008/4/24','2008/4/24','A'),
  (26548913,100000002,101,2,'2008/4/24','2008/4/24','B'),
  (36549879,100000001,102,1,'2008/4/24','2008/4/25','A'),
  (46846589,100000004,103,4,'2008/4/25','2008/4/25','B'),
  (59871321,100000004,NULL,4,'2008/4/25','2008/4/25','C'),
  (69879231,100000003,103,2,'2008/4/25','2008/4/25','C'),
  (76983231,100000001,NULL,3,'2008/4/25','2008/4/25','C'),
  (86213939,100000004,102,9,'2008/4/25','2008/4/21','A'),
  (93216548,100000002,101,2,'2008/4/25','2008/4/25','B');



CREATE TABLE room(
   roomnumber  INTEGER  NOT NULL  
  ,roomtype    VARCHAR(6) NOT NULL
  ,blockfloor  INTEGER  NOT NULL
  ,blockcode   INTEGER  NOT NULL
  ,unavailable VARCHAR(1) NOT NULL
);
ALTER TABLE room
ADD CONSTRAINT PRIMARY KEY(roomnumber);

ALTER TABLE room
	ADD CONSTRAINT foreign key(blockfloor, blockcode) REFERENCES block(blockfloor, blockcode);

INSERT INTO room(roomnumber,roomtype,blockfloor,blockcode,unavailable) VALUES (101,'Single',1,1,'f'),
 (102,'Single',1,1,'f'),
 (103,'Single',1,1,'f'),
 (111,'Single',1,2,'f'),
 (112,'Single',1,2,'t'),
 (113,'Single',1,2,'f'),
 (121,'Single',1,3,'f'),
 (122,'Single',1,3,'f'),
 (123,'Single',1,3,'f'),
 (201,'Single',2,1,'t'),
 (202,'Single',2,1,'f'),
 (203,'Single',2,1,'f'),
 (211,'Single',2,2,'f'),
 (212,'Single',2,2,'f'),
 (213,'Single',2,2,'t'),
 (221,'Single',2,3,'f'),
 (222,'Single',2,3,'f'),
 (223,'Single',2,3,'f'),
 (301,'Single',3,1,'f'),
 (302,'Single',3,1,'t'),
 (303,'Single',3,1,'f'),
 (311,'Single',3,2,'f'),
 (312,'Single',3,2,'f'),
 (313,'Single',3,2,'f'),
 (321,'Single',3,3,'t'),
 (322,'Single',3,3,'f'),
 (323,'Single',3,3,'f'),
 (401,'Single',4,1,'f'),
 (402,'Single',4,1,'t'),
 (403,'Single',4,1,'f'),
 (411,'Single',4,2,'f'),
 (412,'Single',4,2,'f'),
 (413,'Single',4,2,'f'),
 (421,'Single',4,3,'t'),
 (422,'Single',4,3,'f'),
 (423,'Single',4,3,'f');


CREATE TABLE procedures(
   code INTEGER  NOT NULL  
  ,name VARCHAR(30) NOT NULL
  ,cost INTEGER  NOT NULL
);

ALTER TABLE procedures
ADD CONSTRAINT PRimary key(code);

INSERT INTO procedures(code,name,cost) VALUES (1,'Reverse Rhinopodoplasty',1500),
 (2,'Obtuse Pyloric Recombobulation',3750),
 (3,'Folded Demiophtalmectomy',4500),
 (4,'Complete Walletectomy',10000),
 (5,'Obfuscated Dermogastrotomy',4899),
 (6,'Reversible Pancreomyoplasty',5600),
 (7,'Follicular Demiectomy',25);




CREATE TABLE trained_in(
   physician            INTEGER  NOT NULL 
  ,treatment            INTEGER  NOT NULL 
  ,certificationdate    varchar(10)  NOT NULL
  ,certificationexpires varchar(10)  NOT NULL
);

ALTER TABLE trained_in
ADD CONSTRAINT foreign key(Physician) references Physician(employeeid);

ALTER TABLE trained_in
ADD CONSTRAINT foreign key(treatment) references procedures(code);

	ALTER TABLE  trained_in
    ADD CONSTRAINT trained_in_ PRIMARY KEY  (physician, treatment);
 
 
 INSERT INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (3,1,'1/1/2008','31/12/2008'),
 (3,2,'1/1/2008','31/12/2008'),
 (3,5,'1/1/2008','31/12/2008'),
 (3,6,'1/1/2008','31/12/2008'),
 (3,7,'1/1/2008','31/12/2008'),
 (6,2,'1/1/2008','31/12/2008'),
 (6,5,'1/1/2007','31/12/2007'),
 (6,6,'1/1/2008','31/12/2008'),
 (7,1,'1/1/2008','31/12/2008'),
 (7,2,'1/1/2008','31/12/2008'),
 (7,3,'1/1/2008','31/12/2008'),
 (7,4,'1/1/2008','31/12/2008'),
 (7,5,'1/1/2008','31/12/2008'),
 (7,6,'1/1/2008','31/12/2008'),
 (7,7,'1/1/2008','31/12/2008');
    
    
    
CREATE TABLE affiliated_with(
   physician          INTEGER  NOT NULL 
  ,department         INTEGER  NOT NULL
  ,primaryaffiliation VARCHAR(1) NOT NULL
);

ALTER TABLE affiliated_with
ADD CONSTRAINT foreign key(Physician) references Physician(employeeid);

ALTER TABLE affiliated_with
ADD CONSTRAINT foreign key(department) references department(department_id);

ALTER TABLE affiliated_with
    add CONSTRAINT affiliated_with PRIMARY KEY (physician, department);


INSERT INTO affiliated_with(physician,department,primaryaffiliation) 
VALUES (1,1,'t'),
(2,1,'t'),
(3,1,'f'),
(3,2,'t'),
(4,1,'t'),
(5,1,'t'),
(6,2,'t'),
(7,1,'f'),
(7,2,'t'),
(8,1,'t'),
(9,3,'t');


CREATE TABLE Patient(
   ssn         INTEGER  NOT NULL  
  ,name        VARCHAR(17) NOT NULL
  ,address     VARCHAR(18) NOT NULL
  ,phone       VARCHAR(9) NOT NULL
  ,insuranceid INTEGER  NOT NULL
  ,pcp         INTEGER  NOT NULL
);

ALTER TABLE patient
ADD CONSTRAINT foreign key(pcp) references Physician(employeeid);

ALTER TABLE patient
ADD CONSTRAINT PRIMARY KEY(ssn);

INSERT INTO Patient(ssn,name,address,phone,insuranceid,pcp)
 VALUES (100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1),
(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2),
(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2),
(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);


CREATE TABLE prescribes(
   physician   INTEGER  NOT NULL  
  ,patient     INTEGER  NOT NULL
  ,medication  INTEGER  NOT NULL
  ,date        VARCHAR(15) NOT NULL
  ,appointment INTEGER 
  ,dose        INTEGER  NOT NULL
);

ALTER TABLE prescribes
ADD CONSTRAINT foreign key(Physician) references Physician(employeeid);

ALTER TABLE prescribes
ADD CONSTRAINT foreign key(Patient) references patient(ssn);

ALTER TABLE prescribes
ADD CONSTRAINT foreign key(medication) references medication(code);

ALTER TABLE prescribes
    add CONSTRAINT prescribes PRIMARY KEY (physician, Patient, Medication, date);

INSERT INTO prescribes(physician,patient,medication,date,appointment,dose) 
VALUES (1,100000001,1,'24/4/2008',13216584,5),
 (9,100000004,2,'27/4/2008',86213939,10),
 (9,100000004,2,'30/4/2008',NULL,5);



CREATE TABLE MEDICATION(
   code        INTEGER  NOT NULL  
  ,name        VARCHAR(13) NOT NULL
  ,brand       VARCHAR(23)
  ,description VARCHAR(3) NOT NULL
);

ALTER TABLE MEDICATION
ADD CONSTRAINT PRIMARY KEY(code);

INSERT INTO MEDICATION(code,name,brand,description) 
VALUES (1,'Procrastin-X',NULL,'N/A'),
 (2,'Thesisin','Foo Labs','N/A'),
 (3,'Awakin','Bar Laboratories','N/A'),
 (4,'Crescavitin','Baz Industries','N/A'),
 (5,'Melioraurin','Snafu Pharmaceuticals','N/A');
 
SELECT * FROM MEDICATION;

CREATE TABLE stay (
    stayid integer NOT NULL,
    patient integer NOT NULL,
    room integer NOT NULL,
    start_time date NOT NULL,
    end_time date NOT NULL
);
ALTER TABLE stay
ADD CONSTRAINT PRIMARY KEY(stayid);

ALTER TABLE stay
ADD CONSTRAINT foreign key(Patient) references Patient(ssn);

ALTER TABLE stay
ADD CONSTRAINT foreign key(room) references room(roomnumber);

INSERT INTO STAY(stayid,patient,room,start_time,end_time) 
VALUES (3215,'100000001','111','2008/5/1','2008/5/4'),
(3216,'100000003','123','2008/5/3','2008/5/14'),
(3217,'100000004','112','2008/5/2','2008/5/3');




CREATE TABLE on_call(
   nurse       INTEGER  NOT NULL  
  ,blockfloor INT NOT NULL
  ,blockcode   INT  NOT NULL
  ,oncall      DATE  NOT NULL
  ,oncallend   timestamp  NOT NULL
);

    
ALTER TABLE on_call
ADD CONSTRAINT foreign key(nurse) references nurse(employeeid);

ALTER TABLE on_call
	ADD Constraint PRIMARY KEY (nurse, blockfloor, blockcode, oncall, oncallend);

ALTER TABLE on_call 
MODIFY blockfloor INT NOT NULL;

ALTER TABLE on_call
	ADD constraint Foreign KEY(blockfloor, blockcode) references block(blockfloor, blockcode);


INSERT INTO on_call(nurse,blockfloor,blockcode,oncall,oncallend) 
VALUES (101,1,1,'2008/11/4', '2008/11/5 12:08:23' ),
 (101,1,2,'2008/11/4', '2008/11/6 12:08:23' ),
 (102,1,3,'2008/11/4', '2008/11/7 12:08:23' ),
 (103,1,1,'2008/11/4', '2008/11/8 12:08:23' ),
 (103,1,2,'2008/11/4', '2008/11/9 12:08:23' ),
 (103,1,3,'2008/11/4', '2008/11/10 12:08:23' );

CREATE TABLE Undergoes(
   patient        INTEGER  NOT NULL 
  ,procedures      INTEGER  NOT NULL
  ,stay           INTEGER  NOT NULL
  ,date           VARCHAR(9) NOT NULL
  ,physician INTEGER  NOT NULL
  ,assistingnurse       INTEGER 
);
ALTER TABLE Undergoes
ADD CONSTRAINT foreign key(Patient) references patient(ssn);

ALTER TABLE Undergoes
ADD CONSTRAINT foreign key(procedures) references procedures(code);

ALTER TABLE Undergoes
ADD CONSTRAINT foreign key(stay) references stay(stayid);

ALTER TABLE Undergoes
RENAME COLUMN physicianassit TO Physician;

ALTER TABLE Undergoes
RENAME COLUMN ingnurse TO assistingnurse;

ALTER TABLE Undergoes
ADD constraint fOREIGN KEY(physician) REFERENCES Physician(employeeid);

ALTER TABLE Undergoes
ADD constraint fOREIGN KEY(assistingnurse) REFERENCES Nurse(employeeid);

INSERT INTO Undergoes(patient,procedures,stay,date,physicianassit,ingnurse) 
VALUES (100000001,6,3215,'2/5/2008',3,101),
(100000001,2,3215,'3/5/2008',7,101),
(100000004,1,3217,'7/5/2008',3,102),
(100000004,5,3217,'9/5/2008',6,NULL),
(100000001,7,3217,'10/5/2008',7,101),
(100000004,4,3217,'13/5/2008',3,103);



CREATE TABLE Block (
blockfloor INT NOT NULL,
blockcode INT NOT NULL
);
DROP TABLE BLOCK;
INSERT INTO BLOCK(blockfloor, blockcode)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(3,1),
(3,2),
(3,3),
(4,1),
(4,2),
(4,3);
ALTER TABLE Block
    add CONSTRAINT block_in PRIMARY KEY (blockfloor, blockcode);



														-- Querys
-- Q1) Write a query in SQL to find all the information of the nurses who are yet to be registered. 
	SELECT *
    FROM Nurse
    WHERE registered = 'f';

-- Q2) Write a query in SQL to find the name of the nurses who are the head of their department.
	SELECT name, position
    FROM Nurse
    WHERE position LIKE ('%head%');


-- Q3) Write a query in SQL to obtain the name of the physicians who are the head of each department.
	SELECT ph.employeeid, ph.name, d.name
    FROM Physician ph
	JOIN department d
    ON ph.employeeid = d.head;
    
-- Q4) Write a query in SQL to count the number of patients who taken appointment with at least one physician.
	SELECT  ph.name, Count(patient) AS Total_patient
    FROM appointment ap
    JOIN Physician ph
    ON ap.physician = ph.employeeid
    GROUP BY ph.name
	HAVING total_patient > 0;
    
-- Q5) Write a query in SQL to find the floor and block where the room number 212 belongs to.
    SELECT r.roomnumber, b.blockfloor, b.blockcode
    FROM room r
    JOIN block b
    ON r.blockfloor = b.blockfloor AND r.blockcode = b.blockcode
    WHERE roomnumber = 212;
    
-- Q6) Write a query in SQL to count the number available rooms
	SELECT count(roomnumber) AS available_room
    FROM room
    WHERE unavailable = 't';
    
-- Q7) Write a query in SQL to count the number of unavailable rooms.
	SELECT count(roomnumber) AS unavailable_room
    FROM room
    WHERE unavailable = 'f';
    
-- Q8) Write a query in SQL to obtain the name of the physician and the departments they are affiliated with. 
	SELECT ph.name, d.name
    FROM affiliated_with af
    JOIN physician ph 
    ON af.physician = ph.employeeid
    JOIN department d 
    ON af.department = d.department_id
    WHERE primaryaffiliation = 't';

-- Q9) Write a query in SQL to obtain the name of the physicians who are trained for a special treatement.
	SELECT ph.name, pr.name
    FROM trained_in t 
    JOIN physician ph 
    ON t.physician = ph.employeeid
    JOIN Procedures pr
    ON t.treatment = pr.code;

-- Q10) Write a query in SQL to obtain the name of the physicians with department who are yet to be affiliated.
	SELECT ph.name, d.name
    FROM affiliated_with af
    JOIN physician ph 
    ON af.physician = ph.employeeid
    JOIN department d 
    ON af.department = d.department_id
    WHERE primaryaffiliation = 'f';	

-- Q11) Write a query in SQL to obtain the name of the physicians who are not a specialized physician.
	SELECT ph.name
    FROM trained_in t
    JOIN Physician ph
    ON t.physician = ph.employeeid
    JOIN procedures pr
	ON t.treatment = pr.code
    WHERE t.physician IS NULL;
    
-- Q12) Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatement. 
	SELECT pa.name AS Patient, ph.name AS Doctor
    FROM undergoes un
    JOIN Physician ph
    ON Un.physician = ph.employeeid
    JOIN Patient pa 
    ON Un.patient = pa.ssn;

-- Q13) Write a query in SQL to find the name of the patients and the number of physicians they have taken appointment.
	SELECT pa.name AS Patient, COUNT(Distinct ph.name) AS Total_Physician
    FROM appointment ap
    JOIN Physician ph
    ON ap.physician = ph.employeeid
    JOIN Patient pa 
    ON ap.patient = pa.ssn
    GROUP BY pa.name;
    
-- Q14) Write a query in SQL to count number of unique patients who got an appointment for examination room C. 
    SELECT COUNT(pa.name) total_patient, ap.examinationroom
	FROM appointment ap
	JOIN patient pa 
    ON ap.patient = pa.ssn
    GROUP BY ap.examinationroom
    HAVING ap.examinationroom = 'c';
    
-- Q15) Write a query in SQL to find the name of the patients and the number of the room where they have to go for their treatment. 
	SELECT pa.name, s.room
	FROM patient pa 
    JOIN Stay S 
    ON pa.ssn = S.patient;
    
-- Q16) Write a query in SQL to find the name of the nurses and the room scheduled, where they will assist the physicians.
	SELECT n.name, r.roomnumber
    FROM Undergoes un
	JOIN nurse n
	ON un.assistingnurse = n.employeeid
    JOIN stay s
	ON Un.stay = s.stayid
    JOIN room r
    ON s.room = r.roomnumber;
    
/*Q17)Write a query in SQL to find the name of the patients who taken the appointment on the 25th of April at 10 am, and also display their physician, 
assisting nurses and room no.*/
	SELECT pa.name, ph.name, n.name, r.roomnumber, ap.start_dt
    FROM undergoes un
	JOIN patient pa 
    ON Un.patient = pa.ssn
    JOIN physician ph 
    ON un.Physician = ph.employeeid
    JOIN Nurse n 
    ON un.assistingnurse = n.employeeid
	JOIN appointment ap
    ON  ap.prepnurse = n.employeeid
    JOIN stay s
    ON un.stay = s.stayid
    JOIN room r 
    ON s.room = r.roomnumber
    WHERE ap.start_dt = 2008-04-24;
    
-- Q18))Write a query in SQL to find the name of patients and their physicians who does not require any assistance of a nurse.
	SELECT pa.name AS patient_name, ph.name AS Physician_name
    FROM undergoes un 
    JOIN patient pa 
    ON un.patient = pa.ssn
    JOIN physician ph 
    ON un.physician = ph.employeeid
    WHERE assistingnurse is NULL;
    

    






