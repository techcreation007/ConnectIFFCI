$(document).ready(function(){


$(".left-nav-main1 .glyphicon").mouseenter(function(){
	$(".left-nav-menu1").addClass("left-nav-menu1-show");
});
$(".left-nav-menu1").mouseleave(function(){
	$(".left-nav-menu1").removeClass("left-nav-menu1-show");
});

$(".contract-tab-item-area .item").click(function(){	
	$(".contract-tab-item-area .item").removeClass("active");
	$(this).addClass("active");
});

$("#draft-contract-menu").click(function(){
	$(".contract-tab-item-area-box-main").addClass("active");
});
$("#contract-menu").click(function(){
	$(".contract-tab-item-area-box-main").removeClass("active");
}); 

$(".search-bar-btn").click(function(){
	$(this).find("span").toggleClass("glyphicon-search");
	$(this).find("span").toggleClass("glyphicon-chevron-left");
	$(".main-con").toggleClass("full-page-view");
});

$(".search-bar-hierarchy").click(function(){
	$(this).find("span").toggleClass("glyphicon-search");
	$(this).find("span").toggleClass("glyphicon-chevron-left");
	$(".main-con").toggleClass("full-page-hierarchy");
});


$('.scrollbox').enscroll();


//$("#tree-hierarchy").treeview({
//				collapsed: false,
//				animated: "medium",
//				control:"#sidetreecontrol",
//				persist: "location"
//});
//$("#tree-hierarchy-main").treeview({
//				collapsed: false,
//				animated: "medium",
//				control:"#sidetreecontrol",
//				persist: "location"
//});

$("#edit-contract1").click(function(){
	$(this).hide();
	$("#edit-contract1save").show();
	$("#edit-tab-content1").find(".form-control").removeAttr("disabled");
	$("#edit-tab-content1").find(".hide1").show();
});
$("#edit-contract1save").click(function(){
	$(this).hide();
	$("#edit-contract1").show();
	$("#edit-tab-content1").find(".form-control").attr("disabled", "true");
	$("#edit-tab-content1").find(".hide1").hide();
});


$(".search-lst-table tbody tr").click(function(){
$(".search-lst-table tbody tr").removeClass("tablr-rw-active");
$(this).addClass("tablr-rw-active");
});

});