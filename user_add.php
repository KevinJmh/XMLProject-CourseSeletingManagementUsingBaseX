<html>
<head>
    <title>Add User</title>
     <link  href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <form action="user_update.php" method="post" id="login">
    <h1> Add user</h1>
    <table width="398">
  <tr><th width="338">  UserType:   
  <select name="type"> 
    <option value="student">student</option> 
    <option value="teacher">teacher</option> 
    <option value="admin">Admin</option>   
    </select>     
   </th></tr>
   <tr><th>
    Name: <input type="text" name="name" />
    </th>
    </tr>
       <tr><th>
    Detail: <input type="text" name="detail" />
    </th>
    </tr>
    <tr>
      <th>
    Pwd  :   
      <input type="password" name="password" />
    </th></tr></table>
    <input type="submit" value="Submit" id="submit"/>
</form>
</body>
</html>