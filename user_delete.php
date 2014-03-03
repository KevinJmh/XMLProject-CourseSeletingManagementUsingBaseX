<?php  
    print "<script language=\"JavaScript\">\r\n";   
    print " alert(\"Delete Successfully!\");\r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"user_table.xml\");\r\n";   
    print "</script>";   
    
$type=$_REQUEST["type"];var_dump($_REQUEST);

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

$userxml=('user_table.xml');
 $uID=$_REQUEST["id"];

 deleteFromXML($xmlFile, $uID);
  deleteFromXML($userxml, $uID);

 function deleteFromXML($filename, $id){
  $xml=simplexml_load_file($filename);
    $i=0;
     foreach($xml as $dup){
      $sc=$dup->attributes();
      if($sc['id']==$id){
        unset($xml->user[$i]);
        $xml->asXML($filename);
        return;
        }
      $i++;
     }
 }


?>