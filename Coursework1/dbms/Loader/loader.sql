INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES (“Harry”,”Potter”,”121 Godricks Hallow”,”Mars”,”PO6 6XY”,”1991-02-28”,”M”);


INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Ronald','Weasley','123 Gribly Street','Mars','EH9 5EW',’1961-12-02’,'M');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Daniel','Radcliffe','12 Broke Street','Mars','HI6 5BW',’1991-06-18’,'M');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Fariah','Khan','21 Sing Street','Earth','GK7 9KF',’1971-02-20’,'F');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES('James','Patinson','25 Real Street','Jupiter','RS3 9NT',’1997-01-28’,'M');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Venus','Ray','2 Neighbour Earth','Venus','MS6 5GJ',’1990-09-11’,'F');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Darth','Vader','12/1 Enemies Lane','Edinburgh','JK5 6FK',’1981-06-25’,'F');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Peter','Potter','66 Murdock Terrace','Edinburgh','MK1 1DJ',’1956-12-20’,'F');

INSERT INTO `Members`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Jeff','Stevens','86 High Street','Manchester','SD6 15MS',’1987-03-03’,'M');

INSERT INTO `Members`( `firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`) VALUES ('Theresa','May','89 Westminster ','London','P9 5MW',’1994-06-05’,'F');


INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Peter','Stevens','92/6 High Riggs','Edinburgh','EH9 3JH','1993-08-11','M','30,000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('White','Kinley','Olof Street','Olof','OL2 45NM',’1994-09-09’,'M','25000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Jammie','Phinnick','76 American Street','Jamaica','PA0 1SJ',’1983-10-10’,'F','20000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Georgina','Bush','1 Jordan Lane','DC','WO1 1IK',’1981-08-19’,'F','25000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Alex','Fisher','61 Sing Street','Dublin','WI7 8OK',’1978-09-19’,'M','25000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Fanny','Stalin','928/8 Crab Street','Finland','UD6 6IN',’1979-02-01’,'F','20000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Martin','Black','289/6 Baron Lane', 'Mars','U9 99UM',’1990-01-23’,'M','25500');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Nick','McCain','2/8 Herriot Street','London','T7 89JK',’1994-07-24’,'M','20000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Vereena','McCullough','8 Queens Street','Chiswick','TY8 8JN',’1982-05-29’,'F','30000');

INSERT INTO `Staff`(`firstName`, `surname`, `addressLine1`, `addressLine2`, `postcode`, `dateofBirth`, `gender`, `salary`) VALUES ('Julius','Patterson','73 Finnish Street','Birmingham','EH3 7YJ',’1977-03-22’,'M','25000');

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Karate','Sat',’12:30’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Karate','Tue',’11:30’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Archery','Tue',’16:00’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Archery','Mon',’16:00’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Fencing','Thurs',’10:00’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Fencing','Wed',’15:00’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Yoga','Tue',’18:00’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES('Wall Climbing','Mon',’11:30’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Wall Climbing','Fri',’16:30’);

INSERT INTO `Classes`(`className`, `dayTaught`, `time`) VALUES ('Kung Fu','Fri',’14:00’);



INSERT INTO `Equipment`(`equipmentName`) VALUES ('Swords');

INSERT INTO `Equipment`(`equipmentName`) VALUES ('Climbing rope');

INSERT INTO `Equipment`(`equipmentName`) VALUES ('Yoga matt');

INSERT INTO `Equipment`(`equipmentName`) VALUES ('Kung Fu suit');


INSERT INTO `Rooms`(`roomName`) VALUES ('Martial Art Hall');
INSERT INTO `Rooms`(`roomName`) VALUES ('Archery Room');
INSERT INTO `Rooms`(`roomName`) VALUES ('Fencing Hall');
INSERT INTO `Rooms`(`roomName`) VALUES ('Yoga room');
INSERT INTO `Rooms`(`roomName`) VALUES ('Wall climbing room');


INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-18',’11:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-18',’16:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-03-17',’16:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-16',’11:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-15',’10:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-03-12',’12:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-03-22',’18:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-15',’18:30’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-03-20',’18:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-22',’18:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-23',’16:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-03-08',’11:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking``) VALUES ('2017-02-13',’12:00’);
INSERT INTO `Bookings`( `dateofBooking`, `timeofBooking`) VALUES ('2017-03-02',’15:30’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-25',’14:30’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-24',’11:00’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-02, '12:30’);
INSERT INTO `Bookings`(`dateofBooking`, `timeofBooking`) VALUES ('2017-02-12',’13:00’);

INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (1,"Silver");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (2,"Gold");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (3,"Bronze");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (4,"Gold");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (5,"Bronze");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (6,"Gold");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (7,"Gold");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (8,"Silver");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (9,"Gold");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (10,"Gold");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (11,"Bronze");
INSERT INTO `Membership Types`(`memberID`, `type`) VALUES (12,"Gold");

INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (1,1);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (1,2);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (1,10);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (2,3);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (2,4);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (3,5);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (3,6);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (4,7);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (5,8);
INSERT INTO `StaffInstructors`(`staffID`, `classID`) VALUES (5,9);

INSERT INTO ‘ClassBookings’(‘bookingID’,’classID’) VALUES(1,1);
INSERT INTO ‘ClassBookings’(‘bookingID’,’classID’) VALUES(2,4);
INSERT INTO ‘ClassBookings’(‘bookingID’,’classID’) VALUES(3,5);
INSERT INTO ‘ClassBookings’(‘bookingID’,’classID’) VALUES(4,1);
INSERT INTO ‘ClassBookings’(‘bookingID’,’classID’) VALUES(5,1);
INSERT INTO ‘ClassBookings’(‘bookingID’,’classID’) VALUES(6,1);

INSERT INTO ‘EquipmentBookings’(‘bookingID’,’equipmentID’) VALUES(1,1):

INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (6,1);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (7,3);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (8,11);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (9,9);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (10,10);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (11,2);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (13,1);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (15,1);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (16,5);
INSERT INTO `EquipmentBookings`(`bookingID`, `equipmentID`) VALUES (17,5);

INSERT INTO `RoomBookings`(`bookingID`, `roomID`) VALUES (18,1);
INSERT INTO `RoomBookings`(`bookingID`, `roomID`) VALUES (19,2);
INSERT INTO `RoomBookings`(`bookingID`, `roomID`) VALUES (20,3);

INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (2,1);
INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (3,1);
INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (4,1);
INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (6,5);
INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (7,5);
INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (9,8);
INSERT INTO `StaffSupervisors`(`staffID`, `supervisorsStaffID`) VALUES (10,8); 
