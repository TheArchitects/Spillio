$(function(){
  var sendProjectRequest = function(groupId, projectId, priority) {
    $.ajax({
      type: "POST",
      url: "/project/"+projectId+"/request_from_group/"+groupId,
      data: { priority: priority },
      success: function(data) {
        console.log("Yei :)");
        return false;
      },
      error: function(data) {
        console.log("Nai :(");
        return false;
      }
    });
  };

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
    //sendProjectRequest(groupId, projectId, priority);
  });
});