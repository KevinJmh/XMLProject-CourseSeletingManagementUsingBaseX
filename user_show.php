<?php  

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

$string='<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/xsl" href="user_show.xsl"?>';
$xml = new SimpleXMLElement($string.$result->asXML());
$xml->asXML('temp.xml');
Header("Location:temp.xml");
?>