<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head><title>Transform</title></head>
<body>
<h2>People</h2>
<table>
	<tr>
	<th>First Name</th><th>Last Name</th><th>DOB</th><th>Email</th>
	</tr>
<xsl:for-each select="//person">
	<tr>
	<td><xsl:value-of select ="firstname"/></td>
	<td><xsl:value-of select ="lastname"/></td>
	<td><xsl:value-of select ="DOB"/></td>
	<td><xsl:value-of select ="email"/></td>
	</tr>
</xsl:for-each>
</table>
<h2>Staff</h2>
<table>
	<tr>
	<th>SSN</th><th>Salary</th><th>ManagerID</th>
	</tr>
<xsl:for-each select="//staffMember">
	<tr>
	<td><xsl:value-of select ="SSN"/></td>
	<td><xsl:value-of select ="salary"/></td>
	<td><xsl:value-of select ="ManagerID"/></td>
	</tr>
</xsl:for-each>
</table>
<h2>Members</h2>
<table>
	<tr>
	<th>SSN</th><th>Membership Type</th>
	</tr>
<xsl:for-each select="//member">
	<tr>
	<td><xsl:value-of select ="SSN"/></td>
	<td><xsl:value-of select ="memberType"/></td>
	</tr>
</xsl:for-each>
</table>
<h2>Bookings</h2>
<table>
	<tr>
	<th>StaffID</th><th>MembershipID</th><th>RoomID</th><th>EquipmentID</th><th>Date</th><th>Time</th><th>Cost</th>	
	</tr>
<xsl:for-each select="//booking">
	<tr>
	<td><xsl:value-of select ="StaffID"/></td>
	<td><xsl:value-of select ="MembershipID"/></td>
	<td><xsl:value-of select ="RoomID"/></td>
	<td><xsl:value-of select ="EquipmentID"/></td>
	<td><xsl:value-of select ="Date"/></td>
	<td><xsl:value-of select ="Time"/></td>
	<td><xsl:value-of select ="Cost"/></td>
	</tr>
</xsl:for-each>
</table>
<h2>Room</h2>
<table>
	<tr>
	<th>Name</th><th>Building</th>
	</tr>
<xsl:for-each select="//room">
	<tr>
	<td><xsl:value-of select ="Name"/></td>
	<td><xsl:value-of select ="Building"/></td>
	</tr>
</xsl:for-each>
</table>
<h2>Equipment</h2>
<table>
	<tr>
	<th>Type</th>
	</tr>
<xsl:for-each select="//equipment">
	<tr>
	<td><xsl:value-of select ="Type"/></td>
	</tr>
</xsl:for-each>
</table>
<h2> 1st XPath Expression </h2>
<p>
There are <xsl:value-of select="count(/SportsCentre/Members/member[memberType='Gold'])"/> Gold Members
</p>
<h2> 2nd XPath Expression </h2>
<p>
The Staff Members that salaries are over 12000 are: <xsl:value-of select="/SportsCentre/People/person[@SSN = //staffMember[salary > 12000]/SSN/text()]/firstname/text()"/>
</p>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
