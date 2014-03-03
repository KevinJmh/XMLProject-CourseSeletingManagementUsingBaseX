<html>
<head>
    <meta charset="utf-8">
    <title>教师评价系统</title>
 <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<?php
$xml=simplexml_load_file('admin_table.xml'); //将XML中的数据,
$uid=$_REQUEST["uid"];
$result = $xml->xpath('/admin_table/user[@id='.'"'.$uid.'"]')[0]; 

?>
<div id="welcome" align="right">
 Hello, admin: <?=$result->name?><br/>
 <a href="#">Home</a>
 <a href="login.html">Log off</a>
</div>

<div align="center" id="login">
<h1 align="center">Control Panel</h1>
<table border="0">              
        <tr>
            <td><a href="course_table.xml">Course Management</a></td>
            <td><a href="sc_table.xml">Course Seleting Management</a></td>
            <td><a href="user_table.xml">User Management</a></td>
        </tr>  
</table>
<div style=" font-size:15px; position:absolute; bottom:20px;right:10px">
<tr> <th> 组员：江满华，刘桥伟，陈佳浩，苏安介</th></tr>   
</div>
</body>
</html>