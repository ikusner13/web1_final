<html>
<head>
  <title>Todo List</title>
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
  <link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/6e36a7f304.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="/static/css/main.css">

  <script>
  $(document).ready(function() {
    console.log('COOKIE',document.cookie)
    let decoded = decodeURIComponent(document.cookie)
    let split = decoded.split(';')

    let d = (function() {
      for(let x of split){
        while (x.charAt(0) == ' ') {
          x = x.substring(1);
        }
        if(x.startsWith("theme=")){
          return x.substring('theme='.length, x.length)
        }
      }
      return ""
    })()

    let starting_text = (d == 'dark') ? 'Light' : 'Dark'

    $("#theme").text(starting_text)


    $("#theme").click(function(){
      $('body').toggleClass('dark-mode')

      const theme = $('body').hasClass('dark-mode') ? 'dark' : 'light'
      document.cookie = `theme=${theme}`

      let $current_theme = $("#theme").text() 

      let new_text = ($current_theme == 'Light') ? 'Dark' : 'Light'

      $("#theme").text(new_text)
      console.log('cookie',document.cookie)
    })


    $.getJSON("http://localhost:8080/get_tasks", function(rows) {
        let $table = $('<table class="w3-table w3-bordered w3-border w3-margin-top">')
        let $table_header = $('<tr>')
        $table_header.append(`<th class="w3-center">Edit</th>`)
        $table_header.append(`<th>To-Do</th>`)
        $table_header.append(`<th class="w3-center">Complete?</th>`)
        $table_header.append(`<th class="w3-center">Remove</th>`)
        $table_header.append('</tr>')

        $table.append($table_header)

        $.each(rows, function(i, row) {
            let $table_row = $('<tr>')
                $table_row.append(`<td class="w3-center" style="width: 5%;"><a href="/update_task/${row.id}"><i class="material-icons">edit</i></a></td>`);
                $table_row.append(`<td style="width: 70%;">${row.task}</td>`);

                let complete = `<td class="w3-center" style="width: 15%;"><a href="/update_status/${row.id}/`
                $table_row.append(
                    complete + (row.status ? 
                    '0"><i class="material-icons">check_box</i></a></td>': 
                    '1"><i class="material-icons">check_box_outline_blank</i></a></td>')
                )

                $table_row.append(`<td class="w3-center" style="width: 10%;"><a href="/delete_item/${row.id}"><i class="material-icons">delete</i></a></td>`);
            
            $table_row.append("</tr>");
            $table.append($table_row)
        });
        $table.append("</table>");
        $('#content').append($table)
    });
  })
  </script>
</head>
<body class="{{dict(session)['theme']}}">
%include("header.tpl", session=session)
<div id="content"></div>
%include("footer.tpl", session=session)
</body>
</html>