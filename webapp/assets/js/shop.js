$(function() {
	$(".btn-confirm").on("click", function() {
		var no = $(this).val();

		$.ajax({
			url : "readAjax",
			type : "POST",
			data : {
				"no" : no
			},
			dataType : "json",
			success : function(shopvo) {
				$("#title").html(shopvo.title);
				$("#price").html(shopvo.price);
				$("#no").val(shopvo.no);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	$("#btn-buy").on("click", function() {
		var price = $("#price").text();
		var no = $("#no").val();
		var title = $("#title").text();
		var point = $("#point").val();
		
		if (parseInt(point) < parseInt(price)) {
			alert("캔디가 부족합니다");
			return;
		}

		var vo = {
			"no" : no,
			"title" : title,
			"price" : price
		}

		$.ajax({
			url : "/readingbetter/shop/buy",
			type : "POST",
			data : JSON.stringify(vo),
			contentType : "application/json",
			dataType : "json",
			success : function(scoresVo) {
				$("#myPoint").text("내 캔디수 : " + scoresVo.point);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});