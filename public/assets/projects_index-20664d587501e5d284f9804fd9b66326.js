$(function(){var i=function(i,o,t){$.ajax({type:"POST",url:"/project/"+o+"/request_from_group/"+i,data:{priority:t},success:function(){return console.log("Yei :)"),!1},error:function(){return console.log("Nai :("),!1}})};$(".btn-group").on("click",".btn-primary",function(){var o=$("#group-id").val(),t=$(this).closest(".list-group-item").attr("id").split("-")[1],n=$(this).find(".btn-priority").data("priority");i(o,t,n)})});