/*This script creates a table called “Members” with eight columns. 
The table is used to store details of each member. The “memberID” 
column stores a unique auto incremented integer. This column cannot 
contain null values, every member must have a member ID as it is used 
as a foreign key in another part of the database. The member's first name, 
surname and address line details are all stored in varchar columns with a 
maximum string size of 25 characters. The postcode is stored in a varchar 
column with a maximum string size of 7 characters. The date of birth column 
stores a date value and must not be null, storing each member's age is mandatory. 
Values in the gender column can be one of three items from a set - “M”, “F”, or “Other”. 
The primary key in this table is the “memberID”, it is used as a foreign key in the “MemberBookings” 
and “MembershipTypes” tables. */
CREATE TABLE `Members` (
  `memberID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `surname` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `addressLine1` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `addressLine2` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `postcode` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `dateofBirth` date NOT NULL COMMENT 'YYYY-MM-DD',
  `gender` set('M','F','Other','') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`memberID`)
  UNIQUE KEY ‘memberID’ (‘memberID’)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;    

/*The “Staff” table is much the same as the “Members” table although it contains 
an extra column - “salary”. This is an integer field that contains each member of 
staff’s salary.*/

CREATE TABLE `Staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `surname` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `addressLine1` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `addressLine2` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `postcode` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `dateofBirth` date NOT NULL COMMENT 'YYYY-MM-DD',
  `gender` set('M','F','Other','') CHARACTER SET utf8 DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `staffID` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;    

/*This script creates a table called “Bookings”. It is used to store details of bookings 
that members have made. The table contains three columns - “bookingID”, “dateofBooking”, 
and “timeofBooking”. The “BookingID” column is an auto incremented integer column, which 
cannot be null and is unique. The “dateofBooking” column stores the day, month, and year 
that a member made the booking. It is stored using the date data type. The “timeofBooking” 
column stores the time, in 24 hour format, that the booking was made. The primary key in 
this table is the “bookingID”, it is used in the “ClassBookings”, “RoomBookings”, 
“EquipmentBookings”, and “MemberBookings” tables.*/

CREATE TABLE `Bookings` (
  `bookingID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Unique',
  `dateofBooking` date DEFAULT NULL COMMENT 'YYYY-MM-DD',
  `timeofBooking` varchar(5) DEFAULT NULL COMMENT 'HH:MM',
  PRIMARY KEY (`bookingID`),
  UNIQUE KEY `bookingID` (`bookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8; 

/*This script creates a table called “Classes”.  It contains four columns, “ClassID”, 
“className”, “dayTaught”, and “time”. As with the primary keys in all the other tables, 
“ClassID” is a unique auto incremented integer. The “className” column stores the title 
of the class, which will default to NULL if left empty - this allows staff to timetable 
new class slots before knowing the exact details of them. The “dayTaught” column accepts 
values from a set of the days of the week. The “time” column is a varchar field where the 
text should be in the “HH:MM” format. */

CREATE TABLE `Classes` (
  `classID` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(25) DEFAULT NULL,
  `dayTaught` set('Mon','Tue','Wed','Thurs','Fri','Sat','Sun') DEFAULT NULL,
  `time` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`classID`),
  UNIQUE KEY `classID` (`classID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8; 


/*This script creates a table called “ClassBookings”. This table relates booking ID’s to class 
ID’s. This allows us to store and query all of the bookings for classes. The foreign key 
constraint for update and delete actions on the parent key, for both foreign keys, is to 
cascade. This is required because if a member removes their booking for a class, we want 
to remove it from the list of class bookings. This is the same principle for update actions. 
Also, if a class is no longer running, then we must remove all corresponding rows from this 
table.*/

CREATE TABLE `ClassBookings` (
  `bookingID` int(11) NOT NULL,
  `classID` int(11) NOT NULL,
  KEY `Class Bookings` (`bookingID`),
  KEY `Classes` (`classID`),
  CONSTRAINT `Class Bookings` FOREIGN KEY (`bookingID`) REFERENCES `Bookings` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Classes` FOREIGN KEY (`classID`) REFERENCES `Classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 



/*This script creates a table called “Equipment”. This stores details of all the equipment 
available for members to borrow. Is contains two columns, “EquipmentID” and “equipmentName”.*/

CREATE TABLE `Equipment` (
  `equipmentID` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentName` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`equipmentID`),
  UNIQUE KEY `equipmentID` (`equipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8; 


/*This script creates a table called “EquipmentBookings”. This table relates booking ID’s to 
equipmentID’s. This allows us to store and query all of the bookings for equipment. The 
foreign key constraints were chosen for the same reason as in the “ClassBookings” table. */

CREATE TABLE `EquipmentBookings` (
  `bookingID` int(10) NOT NULL,
  `equipmentID` int(11) NOT NULL,
  KEY `Equipment Bookings` (`bookingID`),
  KEY `EquipmentID` (`equipmentID`),
  CONSTRAINT `Equipment Bookings` FOREIGN KEY (`bookingID`) REFERENCES `Bookings` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EquipmentID` FOREIGN KEY (`equipmentID`) REFERENCES `Equipment` (`equipmentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 


/*This script creates a table called “MembershipTypes”. This table relates member ID’s to 
membership types. The foreign key constraints for update and delete actions on the parent 
key are both cascade. If a member leaves the sports centre, we want to delete all of their 
data from the system. Similarly if a member ID changes for any reason, we want to reflect 
this on the foreign key.*/

CREATE TABLE `MembershipTypes` (
  `memberID` int(11) NOT NULL,
  `type` set('Gold','Silver','Bronze','') CHARACTER SET utf8 DEFAULT 'Bronze',
  KEY `MemberID` (`memberID`),
  CONSTRAINT `MemberID` FOREIGN KEY (`memberID`) REFERENCES `Members` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

/*This script creates a table called “MemberBookings”. This table relates booking ID’s to 
member ID’s, so we know what member each booking ID refers to. The foreign key constraints 
on update or delete actions are to cascade. The reasoning here is the same as the other 
booking relations, we wish to reflect any changes to bookings on the foreign keys. If a 
member wishes to cancel their booking, then we must remove all corresponding rows in this 
table. */

CREATE TABLE `MemberBookings` (
  `bookingID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  KEY `Bookings` (`bookingID`),
  KEY `Members` (`memberID`),
  CONSTRAINT `Bookings` FOREIGN KEY (`bookingID`) REFERENCES `Bookings` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Members` FOREIGN KEY (`memberID`) REFERENCES `Members` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*This script creates a table called “Rooms”. This table stores information on the rooms 
that are available for booking by members. It has two columns, “RoomID” and “roomName”.  
The primary key here. “RoomID”, is an unique auto incremented integer. “roomName” is a 
varchar column. */

CREATE TABLE `Rooms` (
  `roomID` int(11) NOT NULL AUTO_INCREMENT,
  `roomName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  UNIQUE KEY `roomID` (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*This script creates a table called “RoomBookings”. This table relates booking ID’s to 
room ID’s. This allows us to store and query all of the bookings made for rooms. The foreign 
key constraints on update and delete actions to the parent keys are to cascade. This is 
because we want to reflect any change to a members booking on the foreign keys. If a room 
is no longer available for booking, then we must remove all corresponding rows in this table. 
If a member wishes to cancel their booking then we will also remove all corresponding rows 
in this table.*/

CREATE TABLE `RoomBookings` (
  `bookingID` int(10) NOT NULL,
  `roomID` int(11) NOT NULL,
  KEY `Room Bookings` (`bookingID`),
  KEY `Rooms` (`roomID`),
  CONSTRAINT `Room Bookings` FOREIGN KEY (`bookingID`) REFERENCES `Bookings` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Rooms` FOREIGN KEY (`roomID`) REFERENCES `Rooms` (`roomID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

/*This script creates a table called “StaffInstructors”. This table relates staff ID’s to 
class ID’s. This allows us to store and query the list of what class each member of staff 
is teaching. The foreign key constraints on update and delete actions to the parent keys 
are to cascade. This is because if the class is no longer running, then we must delete the 
row containing that class from the table. Assuming that if an instructor is no longer 
available then the class is cancelled, then the same applies to the “staffID” foreign key.*/ 

CREATE TABLE `StaffInstructors` (
  `staffID` int(11) NOT NULL,
  `classID` int(11) NOT NULL,
  KEY `TeachingClassID` (`classID`),
  KEY `InstructorID` (`staffID`),
  CONSTRAINT `InstructorID` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TeachingClassID` FOREIGN KEY (`classID`) REFERENCES `Classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*This script creates a table called “StaffSupervisors”. This table relates staff ID’s to 
their supervisors staff ID. This allows us to store a list of staff members and their 
supervisors which makes accountability simpler when the business encounters problems. The 
foreign key constraints for update and delete actions on the parent keys are to cascade. We 
want to reflect any changes to the parent keys on the foreign keys. If a staff member 
decides to quit, we must remove any rows that correspond to them in this table, as they will 
not have a supervisor anymore. Similarly, if a supervisor decides to quit, we should remove 
any rows corresponding to them - the members of staff who used to be supervised them are 
now without a supervisor. Also, if a member of staff is appointed a new supervisor, we must 
reflect that update in this table. */
CREATE TABLE `StaffSupervisors` (
  `staffID` int(11) NOT NULL,
  `supervisorsStaffID` int(11) NOT NULL,
  KEY `StaffID` (`staffID`),
  KEY `SupervisorID` (`supervisorsStaffID`),
  CONSTRAINT `StaffID` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SupervisorID` FOREIGN KEY (`supervisorsStaffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





