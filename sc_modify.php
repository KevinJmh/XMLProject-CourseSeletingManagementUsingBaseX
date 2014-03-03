<html>
<head>
    <meta charset="utf-8">
    <title>Modify </title>
</head>
<?php  
$xml=simplexml_load_file('sc_table.xml'); //将XML中的数据,
$sc_id=$_REQUEST["sc_id"];

$result = $xml->xpath('/sc_table/sc[@id='.'"'.$sc_id.'"]');
$result[0]->comment=$_REQUEST["comment"];

    $xml->asXML('sc_table.xml');

     echo "Modify Successfully!Go Back in 3 seconds  or ";
    
    $lastUrl=$_SERVER['HTTP_REFERER'];
    Header("Refresh:3;$lastUrl");
    // Header("Location:$lastUrl");    //自动回到上一页
?>

<a href=<?=$_SERVER['HTTP_REFERER']?> ><br/>click here to return...</a>

   
</html>