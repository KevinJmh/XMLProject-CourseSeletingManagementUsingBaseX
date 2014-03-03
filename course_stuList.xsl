<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:variable name="student_table" select="document('student_table.xml')"/>
<xsl:template match="/">

    <html>
    <head>
        <title>Detail</title>
        <link  href="css/style.css" rel="stylesheet" type="text/css" />
        </head>
        <body>
   <br/><br/> <br/> 
     <h1> student list</h1>
     
     <div id="login">  
     
    <table border="1" align="center">
        <tr  bgcolor="#9acd32"><td>ID</td><td>Name</td></tr>
        <xsl:for-each select="stuList/stuID"> 
        <xsl:sort select="."/>
        <tr>
            <td><xsl:value-of select="."/></td><xsl:variable name="stuID" select="."/>
            <td><xsl:value-of select="$student_table/student_table/user[@id=($stuID)]/name"/></td>
        </tr> 
        </xsl:for-each>       
    </table>
    <br/>
    
    </div>
    <div align="center">
    <xsl:element name="a">
                <xsl:attribute name="href">course_table.xml</xsl:attribute>Back to Course Table
    </xsl:element>
</div>

</body>

</html>
</xsl:template>
</xsl:stylesheet>