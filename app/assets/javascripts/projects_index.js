$(function(){
  var deactivateOtherButtons = function(projectId,priority){
    $.each($("label[id|='priority-"+priority+"']"),
      function(i){
        if ($(this).attr("data-project")!==projectId) {
          $(this).attr("class","btn btn-primary");
        };
      }
    );
  };

  $(".btn-group").on("click", ".btn-primary", function(){
    var groupId = $("#group-id").val();
    var projectId = $(this).closest(".list-group-item").attr("id").split("-")[1];
    var priority = $(this).find(".btn-priority").data("priority");
    deactivateOtherButtons(projectId,priority)
  });
});