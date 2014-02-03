$(function() {
  var addSubmission = function() {
    var $row = $(this).closest("tr");
    $row.clone(false).insertAfter($row);
  }

  var removeSubmission = function() {
    // Do not allow removal of single submission row
    if ($(this).closest("table").find("tr").length >= 3) {
      $(this).closest("tr").remove();
    }
  }

  $("#submissions").on("click", ".remove-submission", removeSubmission);
  $("#submissions").on("click", ".add-submission", addSubmission);
});


//make a form for submiting updated task informations
make_editable = function(task_id){
  task_children = $("#task-"+task_id).children();
  task_children.each(
      function(index){
        $(this).replaceWith("<td><input type='text' value='"+$(this).text().trim()+"'></td>")
      }
    )
}


