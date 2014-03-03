<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:variable name="student_table" select="document('student_table.xml')"/>
<xsl:variable name="teacher_table" select="document('teacher_table.xml')"/>
<xsl:variable name="admin_table" select="document('admin_table.xml')"/>
<xsl:variable name="course_table" select="document('course_table.xml')"/>

<xsl:variable name="userType" select="'student'"/>
<xsl:variable name="userID" select="'s001'"/>

<xsl:template match="/">
    <html>
        <head>
        
        <title>Course Selecting System</title>
         <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript"> 
             function modify(sc_id){
                var comment =  window.prompt("Enter what you want to say:","");
                if(comment!="" &amp;&amp; comment!=null){
                   window.top.location="sc_modify.php?sc_id="+(sc_id+"&amp;comment="+comment);//go to modify
                }else{
                    window.alert("Comment hasn's change.");
                }
            }            
        </script>
        </head>
        <body>
       


        <div id="welcome" align="right">
            Hello, <xsl:value-of select="$userType"/>:
            <xsl:choose>
                <xsl:when test="($userType)=('student')">
                    <xsl:value-of select="$student_table/student_table/user[@id=($userID)]/name"/>
                    <br/>
                    <xsl:element name="a">
                        <xsl:attribute name="href">sc_table.xml</xsl:attribute>Home</xsl:element>
                </xsl:when>
                <xsl:when test="($userType)=('teacher')">
                    <xsl:value-of select="$teacher_table/teacher_table/user[@id=($userID)]/name"/>
                    <br/>
                    <xsl:element name="a">
                        <xsl:attribute name="href">course_table.xml</xsl:attribute>Home</xsl:element>
                </xsl:when>
                <xsl:when test="($userType)=('admin')">
                    <xsl:value-of select="$admin_table/admin_table/user[@id=($userID)]/name"/>
                    <br/>
                    <xsl:element name="a">
                        <xsl:attribute name="href">controlPanel.php?uid=<xsl:value-of select="$userID"/></xsl:attribute>Home</xsl:element>
                </xsl:when>
            </xsl:choose>&#xA0;
            <!-- TODO: clean last login data -->
            <xsl:element name="a">
                <xsl:attribute name="href">login.html</xsl:attribute>Log off
            </xsl:element>
        </div>

        <h1 align="center">Course Selecting System </h1>
         <div name="quickLink" align="center">
            Link:
            <!-- <xsl:element name="a">
                <xsl:attribute name="href">sc_table.xml</xsl:attribute>sc_table
            </xsl:element>&#xA0; -->
            <xsl:element name="a">
                <xsl:attribute name="href">course_table.xml</xsl:attribute>course_table</xsl:element>
            <!-- only admin can see users' table -->
            <xsl:if test="$userType='admin'">&#xA0;            
            <xsl:element name="a">
                <xsl:attribute name="href">user_table.xml</xsl:attribute>user_table</xsl:element>
            </xsl:if>
        </div>
        <!-- only student can add course here -->
        <xsl:if test="($userType)=('student')">
        <div style="margin:0 auto;width:100px">
            <xsl:element name="a">
                <xsl:attribute name="href">course_table.xml</xsl:attribute>
                Add Course
            </xsl:element>
        </div>
        </xsl:if> 
        <br/>

        <table border="0" align="center">
            <tr bgcolor="#9acd32" align="center">
                <th>Course</th>
                <xsl:if test="$userType!='student'"><th>Student</th></xsl:if>
                <th>Comment</th>
                <th>Detail</th>
                <xsl:if test="$userType='student'"><th>Modify</th></xsl:if>
                <th>Delete</th>
            </tr>
            <!-- 调用模板显示table -->
            <xsl:choose>
                <xsl:when test="($userType)=('student')">
                    <xsl:call-template name="stu_showtable"/>
                </xsl:when>
                <xsl:when test="($userType)=('teacher')">
                    <xsl:call-template name="tea_showtable"/>
                </xsl:when>
                <xsl:when test="($userType)=('admin')">
                    <xsl:call-template name="admin_showtable"/>
                </xsl:when>
            </xsl:choose>
                <!-- <xsl:if test="($userType)=('student')">
                    <xsl:call-template name="stu"/>
                </xsl:if>
                <xsl:if test="($userType)=('teacher')">
                    <xsl:call-template name="tea"/>
                </xsl:if> -->            
        </table> 
        <!-- table完成 -->
        </body>
    </html>
</xsl:template>

<!-- **************************************** pos=<xsl:value-of select="position()"-->
<xsl:template name="stu_showtable">
    <xsl:for-each select="sc_table/sc">
        <xsl:if test="stuID=($userID)">
        <tr align="center">
            <td><xsl:variable name="cID" select="courseID"/>
            <xsl:element name="a">
                <xsl:attribute name="href">course_show.php?cID=<xsl:value-of select="$cID"/></xsl:attribute>
                <xsl:value-of select="$course_table/course_table/course[@id=($cID)]/name"/></xsl:element></td>
          
            
            <td><xsl:value-of select="comment"/></td>
            <td><xsl:element name="a"><xsl:attribute name="href">sc_show.php?sc_id=<xsl:value-of select="@id"/></xsl:attribute>Show</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">javascript:modify('<xsl:value-of select="@id"/>');</xsl:attribute>Modify Comment</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">sc_delete.php?sc_id=<xsl:value-of select="@id"/></xsl:attribute>Delete</xsl:element></td>
        </tr>
    </xsl:if>
    </xsl:for-each>
</xsl:template>

<!-- **************************************** -->
<xsl:template name="tea_showtable">
    You don't have pemission to see this page.
</xsl:template>

<!-- **************************************** -->
<xsl:template name="admin_showtable">
    <xsl:for-each select="sc_table/sc">
        <xsl:sort select="stuID"/><xsl:sort select="courseID"/>
        <tr>
            <td><xsl:variable name="cID" select="courseID"/>
            <xsl:value-of select="$course_table/course_table/course[@id=($cID)]/name"/></td>
            <td><xsl:variable name="sID" select="stuID"/>
            <xsl:value-of select="$student_table/student_table/user[@id=($sID)]/name"/></td>
            <td><xsl:value-of select="comment"/></td>
            <td><xsl:element name="a"><xsl:attribute name="href">sc_show.php?sc_id=<xsl:value-of select="@id"/></xsl:attribute>Show</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">sc_delete.php?sc_id=<xsl:value-of select="@id"/></xsl:attribute>Delete</xsl:element></td>
        </tr>    
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
