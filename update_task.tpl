<html>
<head>
  <link rel="stylesheet" type="text/css" href="/static/css/main.css">
</head> 
<body class="{{dict(session)['theme']}}">
    <p>Update Task</p>
    <form action="/update_task" method="POST">
        <input type="text" size="100" maxlength="100" name="id" value="{{str(row['id'])}}" hidden/>
        <input type="text" size="100" maxlength="100" name="updated_task" value="{{row['task']}}"/>
        <hr/>
        <input type="submit" name="update_button" value="Update"/>
      <a class="cancel" href="/show_list_ajax">
        <button>Cancel</button>
      </a>
    </form>
</body>
</html>