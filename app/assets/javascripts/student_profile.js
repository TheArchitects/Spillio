$(document).ready(function() {
  $('select').select2();

  $('select').each(function(i,e) {
    if ($(e).attr("data_readonly") == "true") {
      $(e).select2("readonly", true);
    }
  })
});