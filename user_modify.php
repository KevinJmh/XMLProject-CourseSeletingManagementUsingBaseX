<html>
<head>
    <meta charset="utf-8">
    <title>User Modify</title>
       <link  href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<?php  

if(!$_GET){
        die("不允许无参调用本页！");
}

    print "<script language=\"JavaScript\">\r\n";   
    print " function back2userT(){ \r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"user_table.xml\");}\r\n";   
    print "</script>";       

$type=$_REQUEST["type"];
$id=$_REQUEST["id"];

switch ($type) {
    case 'student':
        $xml=simplexml_load_file('student_table.xml'); 
        $result = $xml->xpath('/student_table/user[@id='.'"'.$id.'"]')[0];
        break;
    case 'teacher':
        $xml=simplexml_load_file('teacher_table.xml'); 
        $result = $xml->xpath('/teacher_table/user[@id='.'"'.$id.'"]')[0];
        break;
    case 'admin':
        $xml=simplexml_load_file('admin_table.xml'); 
        $result = $xml->xpath('/admin_table/user[@id='.'"'.$id.'"]')[0];
        break;    
    default:
        # code...
        break;
}
$userxml=simplexml_load_file('user_table.xml'); //将XML中的数据,
$result2 = $userxml->xpath('/user_table/user[@id='.'"'.$id.'"]')[0];
?>


<br/><br/><br/>

<div align="center" ><br>

<form action="user_update.php"  method="post" id="login">
<h1>user modify</h1>
<input type="hidden" name="type" value="<?=$type ?>">
<input type="hidden" name="uID" value="<?=$id ?>">
<table>              
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" value="<?=$result->name  ?>"></td>
            </tr>
            <tr>
                <td>Detail: </td>
                <td><input type="text" name="detail" value="<?=$result->detail  ?>"></td>
            </tr>
            <tr>
                <td>Password：</td>
                 <td><input type="text" name="password" ><font size="1">*留空则不更改</font></td>
            </tr>
            <tr>
                <td></td>
                 <td><input type="submit"  id="submit" value="Submit">
                 <input type="button" id="submit" value="Cancel" onclick="back2userT()"></td>
             </tr>
    </table>   
</form>
</div>
</body>
</html>