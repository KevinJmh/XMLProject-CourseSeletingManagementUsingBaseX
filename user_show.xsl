<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:template match="/user">

    <html>
       <head>
        <title>Detail</title>
           <link  href="css/style.css" rel="stylesheet" type="text/css" />
           </head>
     <br/><br/>   <br/>
     <h1>show users</h1>
      <div id="login">
         <table border="1" align="center">
        <tr bgcolor="#9acd32"><td>Name</td><td>Value</td></tr>
        <tr><td>id</td><td><xsl:value-of select="@id"/></td></tr>
        <tr><td>name</td><td><xsl:value-of select="name"/></td></tr>  
        <tr><td>detail</td><td><xsl:value-of select="detail"/></td></tr>       
    </table>
    <br/>
    </div>
    
    <div align="center">
    <xsl:element name="a">
                <xsl:attribute name="href">user_table.xml</xsl:attribute>Back to User Table
    </xsl:element>
</div>

</html>
</xsl:template>
</xsl:stylesheet>