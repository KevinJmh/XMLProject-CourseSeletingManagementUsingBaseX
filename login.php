
<?php

//自动登录
// if ( isset($_COOKIE["userType"]) && isset($_COOKIE["userID"]) ){
//   redirect($_COOKIE["userType"], $_COOKIE["userID"]);
// }
  //  error_reporting(E_ALL ^ E_NOTICE);
    
//检查传值
// echo $_REQUEST["username"]."<br/>".$_REQUEST["password"];

$username=$_REQUEST["username"];
$password=$_REQUEST["password"];

  //载入用户数据
$xml=simplexml_load_file('user_table.xml'); 

 //查表核对账号密码
$result = $xml->xpath('/user_table/user');
    while(list( , $node) = each($result)) {
        if($node->attributes()['id']==$username && $node->password==$password){
            echo $node->type."登陆成功";
            redirect($node->type,$node->attributes()['id']);
            exit();
        }    
    }
    setcookie("userType", "", time()-3600);
    setcookie("userID", "", time()-3600);
    exit( "登录失败，请尝试<a href='login.html'>重新登录</a>");


//--------登录成功后的重定向------------
function redirect($userType, $userID){
  switch ($userType) {
    case 'student':
      $url="sc_table.xml";
      break;
    case 'teacher':
      $url="course_table.xml";
      break;
    case 'admin':
      $url="controlPanel.php?uid=".$userID;
      modify_xsl('user_table.xsl',"userID", $userID);
      break;    
    default:
      # code...
      break;
  }
    modify_xsl('sc_table.xsl',"userType",$userType);
    modify_xsl('sc_table.xsl',"userID", $userID);
    
    modify_xsl('course_table.xsl',"userType",$userType);
    modify_xsl('course_table.xsl',"userID", $userID);
    

  setcookie("userType", $userType, time()+3600);
  setcookie("userID", $userID, time()+3600);
  // print_r($_COOKIE);// A way to view all cookies

  if(isset($url)){
    Header("Location:$url");
  }
}

// --------modify xsl------------------
function modify_xsl($xslFileName,$attName, $attValue){
    $xsl=simplexml_load_file($xslFileName); 
    $result = $xsl->xpath('/xsl:stylesheet/xsl:variable');
     while(list( , $node) = each($result)) {
        if($node->attributes()['name']==$attName){
            $node->attributes()["select"]=("'".$attValue."'");            
            var_dump($node);
            break;
        }    
    }
    $xsl->asXML($xslFileName);
}

?>
