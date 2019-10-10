SELECT COUNT(classID) AS NumberOfBookingsForClassID1 FROM ClassBookings WHERE classID=1;

SELECT MemberBookings.bookingID, Members.firstName, Members.surname
FROM Members
INNER JOIN MemberBookings
ON MemberBookings.memberID=Members.memberID
WHERE MemberBookings.bookingID = 2;

SELECT SUM(salary) AS TotalStaffSalary FROM Staff;

SELECT Members.*, MembershipTypes.type
FROM Members
INNER JOIN MembershipTypes
ON Members.memberID=MembershipTypes.memberID
WHERE Members.memberID = 4;

SELECT Members.surname, COUNT(MemberBookings.bookingID) AS NumberOfBookings
FROM Members
INNER JOIN MemberBookings
ON MemberBookings.memberID=Members.memberID
GROUP BY surname
HAVING COUNT(MemberBookings.memberID) >= 2;

SELECT AVG(salary) AS salaryAverage, MIN(salary) as minSalary, MAX(salary) AS maxSalary FROM Staff;

UPDATE `Members` SET addressLine1="Heriot Watt", addressLine2="Mary Fergusson Halls", postcode="EH144AS" WHERE memberID = 3;

SELECT COUNT(dateOfBooking) AS numberOfBookings, dateofBooking
FROM Bookings
GROUP BY dateofBooking;

SELECT * FROM Classes WHERE className NOT IN (‘Karate’, ‘Lightsaber Combat’);

DELETE FROM Bookings
WHERE bookingID IN (SELECT bookingID FROM MemberBookings WHERE memberID = 2); 

SELECT * FROM Staff
WHERE staffID IN (SELECT supervisorsstaffID FROM StaffSupervisors);

SELECT * FROM Staff
WHERE staffID NOT IN (SELECT supervisorsstaffID FROM StaffSupervisors);

SELECT S.firstName, S.surname, I.*
FROM Instructors I
INNER JOIN Staff S
WHERE I.staffID = S.staffID;

UPDATE MembershipTypes
SET type = "Gold"
WHERE memberID IN (SELECT memberID
                   FROM Members
                   WHERE surname = "Cena"
                   AND firstName = "John");
 
