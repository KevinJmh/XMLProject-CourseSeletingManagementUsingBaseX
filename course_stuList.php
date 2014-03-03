<?php  
    print "<script language=\"JavaScript\">\r\n";   
    print " function noStuError(){alert(\"No Student Selects This Course.\");\r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"course_table.xml\");}\r\n";   
    print "</script>";       


$xml=simplexml_load_file('sc_table.xml'); //将XML中的数据,
$cID=$_REQUEST["cID"];

$result = $xml->xpath('/sc_table/sc[courseID='.'"'.$cID.'"]');
// var_dump($result);
if(count($result)>0){
    $string='<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/xsl" href="course_stuList.xsl"?>';
    $string=$string."<stuList>";
    foreach ($result as $stu) {
        $string=$string."<stuID>".$stu->stuID."</stuID>";
    }
    $string=$string."</stuList>";

    $xml = new SimpleXMLElement($string);
    echo $xml->asXML();
    $xml->asXML('temp.xml');
    Header("Location:temp.xml");
}else{
    echo "<script type='text/javascript'>noStuError();</script>";
}


?>