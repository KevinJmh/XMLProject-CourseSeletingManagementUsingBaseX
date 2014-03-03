<html>
<head>
    <meta charset="utf-8">
    <title>Course Modify</title>
     <link  href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<?php  

if(!$_GET){
        die("不允许无参调用本页！");
}

    print "<script language=\"JavaScript\">\r\n";   
    print " function back2courseT(){ \r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"course_table.xml\");}\r\n";   
    print "</script>";       

$cID=$_REQUEST["cID"];
// $xml=simplexml_load_file('course_table.xml'); //将XML中的数据,
// $cID=$_REQUEST["cID"];
// $result = $xml->xpath('/course_table/course[@id='.'"'.$cID.'"]')[0];
include("course_query.php");
$ret = basexquery('xquery course_table/course[@id='.'"'.$cID.'"]');     
$result = readasdoms($ret);
//print $dom->name;    
    
?>


<br/><br/><br/>

<div align="center" id="login">
<h1> course modify</h1>
<form action="course_update.php"  method="post">
<input type="hidden" name="cID" value="<?=$cID ?>">
<table>              
            <tr>
                <td>name: </td>
                <td><input type="text" size="30" name="name"  id="inputs"value="<?=$result->name  ?>"></td>
            </tr>
            <tr>
                <td>description：</td>
                 <td><textArea cols="25" id="inputs" rows="3" name="description" ><?=$result->description ?></textArea></td>
            </tr>
           
    </table>   
     <tr>
               <br/>
                 <td><input type="submit"  id="submit"value="Submit"><input type="button" value="Cancel"  id="submit"onClick="back2courseT()"></td>
             </tr>
</form>
</div>
</body>
</html>