<html>
<head>
    <meta charset="utf-8">
    <title>Delete </title>
</head>
<?php  
    print "<script language=\"JavaScript\">\r\n";   
    print " alert(\"Delete Successfully!\");\r\n";   
    // print " history.back();\r\n";   
    echo " location.replace(\"sc_table.xml\");\r\n";   
    print "</script>";   
    

$xml=simplexml_load_file('sc_table.xml'); //将XML中的数据,
$sc_id=$_REQUEST["sc_id"];

$i=0;
 foreach($xml as $dup){
  $sc=$dup->attributes();
  if($sc['id']==$sc_id){
    unset($xml->sc[$i]);
    $xml->asXML('sc_table.xml');
     // echo "Delete Successfully!Go Back in 3 seconds  or ";
     // $lastUrl=$_SERVER['HTTP_REFERER'];
     // Header("Location:$lastUrl");
  }
  $i++;
 }

?>

<!-- <a href=<?=$_SERVER['HTTP_REFERER']?> >click here to return...</a> -->

   
</html>