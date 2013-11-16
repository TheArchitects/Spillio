$(document).ready(function() {
  $('select').select2();
  $('#student_skill_names').select2({
    tags:["ruby", "rails", "java", "iOs", "android"],
    tokenSeparators: [","]
  });
});