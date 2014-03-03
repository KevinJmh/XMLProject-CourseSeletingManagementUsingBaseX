<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
    <head>
     <title>Course Selecting System</title>
      <link  href="css/style.css" rel="stylesheet" type="text/css" />
      </head>
    <body>
        <h1 align="center">Student Table</h1>
        <div style="margin:0 auto;width:350px">
            <xsl:element name="a"> 
                <xsl:attribute name="href">student_add.html</xsl:attribute>
                Add
            </xsl:element>
	   <table align="center" border="0">
	       <tr bgcolor="#9acd32">
		<th align="left">id</th>
		<th align="left">name</th>	       
                        <th align="left">Detail</th>
                        <th align="left">Modify</th>
                        <th align="left">Delete</th>
	       </tr>
	   <xsl:for-each select="student_table/student">
	       <tr>
	           <td><xsl:value-of select="@id" /></td>
	           <td><xsl:value-of select="name"/></td>
    
                    <td> 
                        <xsl:element name="a"> 
                            <xsl:attribute name="href">student_show.php?id=<xsl:value-of select="@id"/></xsl:attribute>
                        Show</xsl:element>
                    </td>
                    <td> 
                        <xsl:element name="a"> 
                            <xsl:attribute name="href">student_modify.php?id=<xsl:value-of select="@id"/></xsl:attribute>
                        Modify</xsl:element>
                    </td>
                    <td> 
                        <xsl:element name="a"> 
                            <xsl:attribute name="href">student_delete.php?id=<xsl:value-of select="@id"/></xsl:attribute>
                        Delete</xsl:element>
                    </td>
                </tr>
                </xsl:for-each>
	</table>
    </div>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
