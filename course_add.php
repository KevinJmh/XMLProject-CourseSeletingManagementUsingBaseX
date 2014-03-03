<html>
<head>
    <title>Add Course</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php  

if(!$_GET){
        die("不允许无参调用本页！");
}

$userType=$_REQUEST["userType"];
$userID=$_REQUEST["userID"];
?>
<form action="course_update.php" method="post"  id="login">
  <h1>Add Course</h1>
  <table width="401">
    
  <tr> <th> <?php 
        if($userType=='admin') {
			
            echo 'teaID: <input type="text" name="teaID" id="inputs"/>';
        }else if($userType=='teacher') {
            echo '<input type="hidden" name="teaID" value="'.$userID.'" id="inputs"/>';
        }
    ?>
    </th>
    </tr>
  
    <tr>  <th>name :                  
            <input type="text" name="name"  id="inputs"/>
    </th>
 
</tr>

    <tr>
      <th>
    desc :  
      <input    align="middle" name="description" rows="3"  type="text"  />
      
   </th> </tr>
   
  </table>
  <tr><input type="submit"  value="Submit" id="submit"/>
  </tr>
</form>
</body>
</html>