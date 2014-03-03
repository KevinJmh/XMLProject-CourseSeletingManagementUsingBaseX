<?php  
    print "<script language=\"JavaScript\">\r\n";   
    print " alert(\"Delete Successfully!\");\r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"course_table.xml\");\r\n";   
    print "</script>";   
    print '<script language="javascript" src="XsltClass.js"></script>';
$sc_id=$_REQUEST["cID"];

include("course_query.php");
// 注意并没有写回文件
try {
  $session = new Session("localhost", 1984, "admin", "admin");
  
  $session->execute("open course_table");
  $input = 'xquery delete nodes course_table/course[(@id =\''.$sc_id.'\')] ';
  print $session->execute($input);

  // close session
  $session->close();


} catch (Exception $e) {
  // print exception
  print $e->getMessage();
}

  $xml_file = readasdoms(readallxml());
  $xml_file->asXML('course_table.xml');


/*
$i=0;
 foreach($xml as $dup){
  $sc=$dup->attributes();
  if($sc['id']==$sc_id){
    unset($xml->course[$i]);
    $xml->asXML('course_table.xml');
    }
  $i++;
 }
*/
 
 
?>
