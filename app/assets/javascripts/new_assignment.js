function addRow()
  {
  var table = document.getElementById("submissions");
  var row = table.insertRow(-1);
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);
  cell1.innerHTML = "<select id='file_type' name='file type'><option value='File'>File</option><option value='Link'>Link</option></select>";
  cell2.innerHTML = "<div class='input-group' style='width:50%'><input class='form-control' name='assignment_name_1' placeholder='name' type='text'></div>";
  cell3.innerHTML = "<div class='input-group' style='width:50%'><input class='form-control' name='description1' placeholder='description' type='text'></div>";
  }
