<html>
<head>
    <meta charset="utf-8">
    <title>Add </title>
</head>
<?php  
$xml=simplexml_load_file('sc_table.xml'); 

$stuID=$_REQUEST["stuID"];
$cID=$_REQUEST["cID"];
$sc_id=$stuID.$cID;

$result = $xml->xpath('/sc_table/sc[@id='.'"'.$sc_id.'"]');
if($result!=null){
    echo "You have already selected this course.<br/>";
}else{
$new=$xml->addChild("sc");

$new->addAttribute("id",$sc_id);
$new->addChild("stuID",$stuID);
$new->addChild("courseID",$cID);
$new->addChild("comment");

$xml->asXML('sc_table.xml');


     echo "Add Course Successfully!<br/>Go Back in 3 seconds  or ";
     $lastUrl=$_SERVER['HTTP_REFERER'];
     Header("Refresh:3;$lastUrl");
    }
?>

<a href=<?=$_SERVER['HTTP_REFERER']?> >click here to return...</a>

   
</html>