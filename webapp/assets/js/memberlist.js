$(function() {
	$(".point-add").click(function() {
		var memberNo = $(this).siblings(".memberNo").val();
		var point = $(this).siblings(".point").val();		
		
		$.ajax({
			url : "/readingbetter/admin/memberlist/updatePoint",
			type : "POST",
			data : {
				"memberNo" : memberNo,
				"point" : point
			},
			dataType : "json",
			success : function() {
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});