<?php
    print "<script language=\"JavaScript\">\r\n";   
    print " alert(\"Course Update Successfully!\");\r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"course_table.xml\");\r\n";     // attention
    print "</script>";
    print '<script language="javascript" src="XsltClass.js"></script>';
           
 
 //$xml=simplexml_load_file('course_table.xml'); //将XML中的数据,
include("course_query.php");
$result = basexquery('xquery .');  
$xml = readasdoms($result);

//检查post参数
if(isset($_POST["cID"])){//如果存在 ?，则为修改；否则为增加
    $cID=$_REQUEST["cID"];
    $edit = $xml->xpath('/course_table/course[@id='.'"'.$cID.'"]')[0];

    $edit->name = ($_REQUEST["name"]);   
    $edit->description = ($_REQUEST["description"]);
    $node_str = $edit->asXML();
    basexquery('xquery replace node course_table/course[(@id =\''.$cID.'\')] with '.$node_str ); 
}else{
    $new=$xml->addChild("course");
    $new->addAttribute("id","c".$_REQUEST["teaID"].substr($_REQUEST["name"],0,3));
    $new->addChild("name",$_REQUEST["name"]);
    $new->addChild("teaID",$_REQUEST["teaID"]);
    $new->addChild("description",$_REQUEST["description"]);
    $node_str = $new->asXML();
    print $node_str;
    basexquery('xquery insert node '.$node_str.' into course_table'); // 插入的节点不要加引号否则会被转义
}

//检查get参数
/*$old_url = $_SERVER["REQUEST_URI"];
//检查链接中是否存在 ?
$check = strpos($old_url, '?'); 
//如果存在 ?
if($check !== false){     
}else{
}*/ 
$xml_file = readasdoms(readallxml());
$xml_file->asXML('course_table.xml');
// $xml->asXML('course_table.xml')//保存到文件
?>