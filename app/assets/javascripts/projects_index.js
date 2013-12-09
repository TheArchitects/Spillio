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

  $(".btn-group").on("click", ".btn-primary", function(){
    var groupId = $("#group-id").val();
    var projectId = $(this).closest(".list-group-item").attr("id").split("-")[1];
    var priority = $(this).find(".btn-priority").data("priority");
    sendProjectRequest(groupId, projectId, priority);
  });
})