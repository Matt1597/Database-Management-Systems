CREATE VIEW TotalClassBookings AS
SELECT COUNT(ClassBookings.classID) AS Number of Bookings, className AS Name of Class
FROM ClassBookings, Classes
WHERE ClassBookings.classID = Classes.classID
GROUP BY ClassBookings.classID;

CREATE VIEW Gold_Members AS
SELECT Members.* FROM Members
INNER JOIN MembershipTypes
ON Members.memberID = MembershipTypes.memberID
WHERE MembershipTypes.type = 'Gold';

CREATE VIEW Number_of_Supervisees AS
SELECT supervisorsStaffID, firstName, surname, COUNT(supervisorsStaffID) AS Number_of_Supervisees
FROM StaffSupervisors, Staff
WHERE StaffSupervisors.staffID = Staff.staffID
GROUP BY StaffSupervisors.supervisorsStaffID;

CREATE VIEW Instructors AS
SELECT staffID, Classes.classID, Classes.className FROM StaffInstructors
INNER JOIN Classes
ON StaffInstructors.classID = Classes.classID
GROUP BY className; 
