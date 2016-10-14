$(function(){
	$("#check-title").on("click", function(){
		$("#check-title").attr('disabled', true);
		
		$("#search-title-result").empty();

		var title = $("#title").val();

		$.ajax({
				url : "/readingbetter/admin/checkbook",
				type : "POST",
				data : {
						"title" : title
					},
					//	dataType : "json",
					// contentType: "application/json",
		success : function(list) {
			for (var i = 0; i < list.length; i++) {
			$("#search-title-result").append(
					"<a class='search-result' data-dismiss='modal'>"
					+ list[i].title + "</a><br>");
		}
	},
	error : function(jqXHR, status, error) {
		console.error(status + " : " + error);
	}
});
});
	
	$("#title").change(function() {
		$("#check-title").attr('disabled', false);
	});
});

$(function(){
	$("#btn-writer").on("click", function(){
		$("#btn-writer").attr('disabled', true);
		
		$("#search-author-result").empty();
		

		var kwd2 = $("#writerTitle").val();

		$.ajax({
			url : "/readingbetter/admin/writercheck",
			type : "POST",
			data : {
				"kwd2" : kwd2
			},
			dataType : "json",
			// contentType: "application/json",
			success : function( authorlist) {
				for (var i = 0; i <  authorlist.length; i++) {
					$("#search-author-result").append(
							"<a class='search-title-result' data-dismiss='modal'>" + 
							authorlist[i].name + 
							"</a><br>");
				}
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("#writerTitle").change(function() {
		$("#btn-writer").attr('disabled', false);
	});
	
	$("#search-author-result").on("click", ".search-title-result", function() {
		$("#authorNo").val($(this).text());
	});
	
	$("#btn-publisher").on("click", function(){		
		$("#btn-publisher").attr('disabled', true);
		
		$("#search-publisher-result").empty();
		

		var kwd1 = $("#publisherTitle").val();

		$.ajax({
			url : "/readingbetter/admin/publishercheck",
			type : "POST",
			data : {
				"kwd1" : kwd1
			},
			dataType : "json",
			// contentType: "application/json",
			success : function( publisherlist) {
				for (var i = 0; i <  publisherlist.length; i++) {
					$("#search-publisher-result").append(
							"<a class='search-title-result' data-dismiss='modal'>" + 
							publisherlist[i].title + 
							"</a><br>");
				}
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("#publisherTitle").change(function() {
		$("#btn-publisher").attr('disabled', false);
	});
	
	$("#search-publisher-result").on("click", ".search-title-result", function() {
		$("#publisher").val($(this).text());
	});
});