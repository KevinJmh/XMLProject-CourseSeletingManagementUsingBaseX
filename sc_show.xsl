<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:variable name="student_table" select="document('student_table.xml')"/>
<xsl:variable name="teacher_table" select="document('teacher_table.xml')"/>
<xsl:variable name="admin_table" select="document('admin_table.xml')"/>
<xsl:variable name="course_table" select="document('course_table.xml')"/>

<xsl:template match="/sc">

    <html>
    <head>
        <title>Detail</title>
           <link  href="css/style.css" rel="stylesheet" type="text/css" />
           </head>
     <br/><br/>   <br/>
       <body>
       <h1> sc show</h1>
      <div id="login">
    <table border="1" align="center">
        <tr  bgcolor="#9acd32"><td>Name</td><td>Value</td></tr>
        <tr><td>id</td><td><xsl:value-of select="@id"/></td></tr>
        <tr><td>stuID</td><td><xsl:value-of select="stuID"/></td></tr>
        <xsl:variable name="stuID" select="stuID"/>
        <tr><td>Student Name</td><td><xsl:value-of select="$student_table/student_table/user[@id=($stuID)]/name"/></td></tr>
        <tr><td>courseID</td><td><xsl:value-of select="courseID"/></td></tr>
        <xsl:variable name="cID" select="courseID"/>
        <tr><td>Course Name</td><td><xsl:value-of select="$course_table/course_table/course[@id=($cID)]/name"/></td></tr>
        <tr><td>comment</td><td><xsl:value-of select="comment"/></td></tr>
    </table>
    <br/>
    </div>
    <div align="center">
    <xsl:element name="a">
                <xsl:attribute name="href">sc_table.xml</xsl:attribute>Back to SC Table
    </xsl:element>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>