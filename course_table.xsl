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
            </xsl:choose>
            &#xA0;
            <!-- TODO: clean last login data -->
            <xsl:element name="a">
                <xsl:attribute name="href">login.html</xsl:attribute>Log off
            </xsl:element>
        </div>



        <h1 align="center">Course Selecting System </h1>
        
      <div name="quickLink" align="center">
            Link:
            <xsl:element name="a">
                <xsl:attribute name="href">sc_table.xml</xsl:attribute>sc_table</xsl:element>&#xA0;
            <!-- <xsl:element name="a">
                <xsl:attribute name="href">course_table.xml</xsl:attribute>course_table
            </xsl:element> -->
            <!-- only admin can see users' table -->
            <xsl:if test="$userType='admin'">&#xA0;            
            <xsl:element name="a">
                <xsl:attribute name="href">user_table.xml</xsl:attribute>user_table</xsl:element>
            </xsl:if>
        </div>
        
        <!-- 以上头部相同 -->
        <xsl:if test="$userType!='student'">
        <div style="margin:0 auto;width:100px">
            <xsl:element name="a">
                <xsl:attribute name="href">course_add.php?userType=<xsl:value-of select="$userType"/>&amp;userID=<xsl:value-of select="$userID"/></xsl:attribute>
                Add Course
            </xsl:element>
        </div> 
        </xsl:if>
        <br/>

        <table border="0" align="center">
            <tr bgcolor="#9acd32" align="center">
                <th>Course</th>
                <th>Detail</th>
                <xsl:if test="$userType!='student'"><th>Student List</th></xsl:if>
                <xsl:if test="$userType!='student'"><th>Modify</th></xsl:if>
                <xsl:if test="$userType!='student'"><th>Delete</th></xsl:if>
                <xsl:if test="$userType='student'"><th>Add</th></xsl:if>
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

            </table> 

        <xsl:if test="$userType='student'">
            <br/>
            <div align="center">
            <xsl:element name="a">
                <xsl:attribute name="href">sc_table.xml</xsl:attribute>
                Back to sc_table
            </xsl:element>
            </div>
        </xsl:if>




</body>

    </html>
</xsl:template>


<!-- **************************************** -->
<xsl:template name="stu_showtable">
    <xsl:for-each select="course_table/course">
        <tr align="center">
            <xsl:variable name="cID" select="@id"/>
            <td><xsl:value-of select="$course_table/course_table/course[@id=($cID)]/name"/></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_show.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Show</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">sc_add.php?stuID=<xsl:value-of select="$userID"/>&amp;cID=<xsl:value-of select="@id"/></xsl:attribute>Add</xsl:element></td>
        </tr>
    </xsl:for-each>
</xsl:template>

<!-- **************************************** -->
<xsl:template name="tea_showtable">
    <xsl:for-each select="course_table/course">
        <xsl:if test="teaID=($userID)">
        <tr><xsl:variable name="cID" select="@id"/>
            <td><xsl:value-of select="$course_table/course_table/course[@id=($cID)]/name"/></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_show.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Show</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_stuList.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Student List</xsl:element></td>
            <!-- go to sc, select teaID and courseID -->
            <td><xsl:element name="a"><xsl:attribute name="href">course_modify.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Modify</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_delete.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Delete</xsl:element></td>
        </tr>
    </xsl:if>
    </xsl:for-each>
</xsl:template>

<!-- **************************************** -->
<xsl:template name="admin_showtable">
    <xsl:for-each select="course_table/course">
        <tr align="center">
            <xsl:variable name="cID" select="@id"/>
            <td><xsl:value-of select="$course_table/course_table/course[@id=($cID)]/name"/></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_show.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Show</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_stuList.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Student List</xsl:element></td>
            <!-- go to sc, select teaID and courseID -->
            <td><xsl:element name="a"><xsl:attribute name="href">course_modify.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Modify</xsl:element></td>
            <td><xsl:element name="a"><xsl:attribute name="href">course_delete.php?cID=<xsl:value-of select="@id"/></xsl:attribute>Delete</xsl:element></td>
        </tr>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
