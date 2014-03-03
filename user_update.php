<?php
    print "<script language=\"JavaScript\">\r\n";   
    print " alert(\"User Update Successfully!\");\r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"user_table.xml\");\r\n";   
    print "</script>";       

$type=$_REQUEST["type"];
switch ($type) {
    case 'student':
        $xmlFile="student_table.xml";
        $prefix="s";
        break;
    case 'teacher':
        $xmlFile="teacher_table.xml";
         $prefix="t";
        break;
    case 'admin':
        $xmlFile="admin_table.xml";
         $prefix="a";
        break;    
    default:
        # code...
        break;
}
$xml=simplexml_load_file($xmlFile);


$userxml=simplexml_load_file('user_table.xml'); //将XML中的数据,

//检查post参数
if(isset($_POST["uID"])){//如果存在 ?，则为修改；否则为增加
    $uID=$_REQUEST["uID"];
    $edit = $userxml->xpath('/user_table/user[@id='.'"'.$uID.'"]')[0];
    if($_REQUEST["password"]!=''){
        $edit->password = ($_REQUEST["password"]);  
    }var_dump($_REQUEST["password"]);echo 'password didnot change';
    $result = $xml->xpath('//user[@id='.'"'.$uID.'"]')[0];
    $result->name = ($_REQUEST["name"]);  
    $result->detail = ($_REQUEST["detail"]);  
}else{
    $new=$userxml->addChild("user");
    $new->addAttribute("id",$prefix.$_REQUEST["name"]);
    $new->addChild("type",$_REQUEST["type"]);
    $new->addChild("password",$_REQUEST["password"]);
//+++++++++++++++++++++++++++
    $new=$xml->addChild("user");
    $new->addAttribute("id",$prefix.$_REQUEST["name"]);
    $new->addChild("name",$_REQUEST["name"]);
    $new->addChild("detail",$_REQUEST["detail"]);
}
// echo $xml->asXML();
// echo $userxml->asXML();
 $xml->asXML($xmlFile);//保存到文件
  $userxml->asXML('user_table.xml');
?>