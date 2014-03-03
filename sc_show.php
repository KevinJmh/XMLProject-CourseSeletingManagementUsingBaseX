    <?php
        $xml=simplexml_load_file('sc_table.xml'); //将XML中的数据,
        $sc_id=$_GET["sc_id"];

        $result = $xml->xpath('/sc_table/sc');
    while(list( , $node) = each($result)) {
        if($node->attributes()['id']==$sc_id){
            // echo $node->comment;
           break;
        }    
    }

    $string='<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/xsl" href="sc_show.xsl"?>';
    $xml = new SimpleXMLElement($string.$node->asXML());
    $xml->asXML('temp.xml');
    Header("Location:temp.xml");

    ?>
