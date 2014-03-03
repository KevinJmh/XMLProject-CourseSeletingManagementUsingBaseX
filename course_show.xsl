<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:variable name="teacher_table" select="document('teacher_table.xml')"/>
<xsl:template match="/course">

    <html>
    <head>
        <title>Detail</title>
         <link  href="css/style.css" rel="stylesheet" type="text/css" />
         </head>
     <br/><br/> <br/>  
     <body>
     <xsl:variable name="teaID" select="teaID"/>
      <h1> course show</h1>
    <div id="login">
   
<table border="1" align="center" >
        <tr bgcolor="#9acd32"><td>Name</td><td>Value</td></tr>
        <tr><td>id</td><td><xsl:value-of select="@id"/></td></tr>
        <tr><td>name</td><td><xsl:value-of select="name"/></td></tr>
        <tr><td>teaID</td><td><xsl:value-of select="teaID"/></td></tr>
        <tr><td>teacher</td><td><xsl:value-of select="$teacher_table/teacher_table/user[@id=($teaID)]/name"/></td></tr>
        <tr><td>description</td><td><xsl:value-of select="description"/></td></tr>
    </table>
    
  
   
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