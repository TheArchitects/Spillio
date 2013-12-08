$(function() {
  var addSubmission = function() {
    var $row = $(this).closest("tr");
    $row.clone().insertAfter($row);
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
