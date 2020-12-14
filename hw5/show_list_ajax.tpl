<html>
<head>
  <title>Todo List</title>
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
  <link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/6e36a7f304.js" crossorigin="anonymous"></script>



  <script>
  $(document).ready(function() {
    $.getJSON("http://localhost:8080/get_tasks", function(rows) {
        let $table = $('<table class="w3-table w3-bordered w3-border">')
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
<body>
%include("header.tpl", session=session)
<div id="content"></div>
%include("footer.tpl", session=session)
</body>
</html>