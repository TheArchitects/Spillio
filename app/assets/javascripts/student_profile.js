$(document).ready(function() {
  $('select').select2();
  $('#student_skill_names').select2({
    tags:["ruby", "rails", "java", "iOs", "android"],
    tokenSeparators: [","]
  });

  // TODO: Test this
  $('select, #student_skill_names').each(function(i,e) {
    if ($(e).attr("data_readonly") == "true") {
      $(e).select2("readonly", true);
    }
  })
});