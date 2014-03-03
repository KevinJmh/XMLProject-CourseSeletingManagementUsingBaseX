<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:variable name="student_table" select="document('student_table.xml')"/>
<xsl:variable name="teacher_table" select="document('teacher_table.xml')"/>
<xsl:variable name="admin_table" select="document('admin_table.xml')"/>

<xsl:variable name="userID" select="'a001'"/>

<xsl:template match="/">
    <html>
    <head>
             <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
    <body>
    
        <div id="welcome" align="right">
            Hello, admin:            
                    <xsl:value-of select="$admin_table/admin_table/user[@id=($userID)]/name"/>
                    <br/>
                    <xsl:element name="a">
                        <xsl:attribute name="href">controlPanel.php?uid=<xsl:value-of select="$userID"/></xsl:attribute>Home</xsl:element>
      
            <!-- TODO: clean last login data -->
            <xsl:element name="a">
                <xsl:attribute name="href">login.html</xsl:attribute>Log off
            </xsl:element>
        </div>

        <h1 align="center">User Table</h1>
        
          <div name="quickLink" align="center">
            Link:
            <xsl:element name="a">
                <xsl:attribute name="href">sc_table.xml</xsl:attribute>sc_table
            </xsl:element> 
            <xsl:element name="a">
                <xsl:attribute name="href">course_table.xml</xsl:attribute>course_table
            </xsl:element>
        </div>

        <div align="center">
            <xsl:element name="a"> 
                <xsl:attribute name="href">user_add.php</xsl:attribute>
                Add User
            </xsl:element>
       <table border="0" align="center">
           <tr bgcolor="#9acd32" align="center">
                  <th>Type</th>
                  <th>ID</th>
                  <th>Name</th>         
                  <th>Detail</th>
                  <th>Modify</th>
                  <th>Delete</th>
           </tr>
       <xsl:for-each select="user_table/user">
          <xsl:sort select="type"/><xsl:sort select="@id"/>
            <xsl:variable name="userType" select="type"/>
            <xsl:variable name="userID" select="@id"/>
           <tr>
                <td><xsl:value-of select="type"/></td>
               <td><xsl:value-of select="@id"/></td>
               <td><xsl:value-of select="name"/>
               <xsl:choose>
                <xsl:when test="($userType)=('student')">
                    <xsl:value-of select="$student_table/student_table/user[@id=($userID)]/name"/>
                </xsl:when>
                <xsl:when test="($userType)=('teacher')">
                    <xsl:value-of select="$teacher_table/teacher_table/user[@id=($userID)]/name"/>
                </xsl:when>
                <xsl:when test="($userType)=('admin')">
                    <xsl:value-of select="$admin_table/admin_table/user[@id=($userID)]/name"/>
                </xsl:when>
              </xsl:choose>
            </td>
    
                    <td> 
                        <xsl:element name="a"> 
                            <xsl:attribute name="href">user_show.php?type=<xsl:value-of select="type"/>&amp;id=<xsl:value-of select="@id"/></xsl:attribute>
                        Show</xsl:element>
                    </td>
                    <td> 
                        <xsl:element name="a"> 
                            <xsl:attribute name="href">user_modify.php?type=<xsl:value-of select="type"/>&amp;id=<xsl:value-of select="@id"/></xsl:attribute>
                        Modify</xsl:element>
                    </td>
                    <td> 
                        <xsl:element name="a"> 
                            <xsl:attribute name="href">user_delete.php?type=<xsl:value-of select="type"/>&amp;id=<xsl:value-of select="@id"/></xsl:attribute>
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
