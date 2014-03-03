<?php
    include("BaseXClient.php");
    
    
    function readasdoms($result_str){
        $dom = simplexml_load_string($result_str); 
        return $dom;    
    }
    // print info of node and subnodes
    function getNodesInfo($node)
    {
        if ($node->hasChildNodes())
        {
            $subNodes = $node->childNodes;
            foreach ($subNodes as $subNode)
            {
                if (($subNode->nodeType != 3)&&($subNode->nodeType != 8)) {
                print "Node name: ".trim($subNode->nodeName)."<br />";
                print "Node value: ".trim($subNode->nodeValue)."<br />";
                 }
            getNodesInfo($subNode);
            }
        }
    }
    
    function readallxml(){
        return basexquery("xquery .");
    }
    
    
    function basexquery($query_str){
        // 注意并没有写回文件
        try {
                $session = new Session("localhost", 1984, "admin", "admin");
  
                $session->execute("open course_table");
                $input = $query_str;
                $exe_result =  $session->execute($input);
  
                // close session
                $session->close();
                return $exe_result;

            } catch (Exception $e) {
                // print exception
                print $e->getMessage();
            }
        
    }

?>