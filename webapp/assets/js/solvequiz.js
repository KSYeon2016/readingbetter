$(function() {
	$("#go-result").on("click", function() {
		var bookNo = $("input[name=no]").val();
		var answerList = new Array();
		var obj;
		
		for(var i=0; i<5; i++){
			obj = new Object();
			obj.quizNo = $("input[name=no" + i +"]").val();
			obj.answer = $(":input[name=selectedRadio" + i +"]:radio:checked").val();
			answerList.push(obj);
		}
		
		$.ajax({
			url : "countquiz",
			type : "POST",
			data : JSON.stringify(answerList),
			contentType: "application/json",
			dataType : "json",
			success : function(count) {
				var url = "resultquiz?count=" + count + "&no=" + bookNo;
				
				location.replace(url);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$(".btn-accusation").click(function() {
		$("#accusation-reason").empty();
		$('div.modal').modal();
		var quizNo = $(this).val();
		
		$.ajax({
			url : "/readingbetter/book/quizAccusationView",
			type : "POST",
			data : {
				"quizNo" : quizNo
			},
			dataType : "json",
			success : function(quizVo) {
				$("#accusation-quiz").text(quizVo.quiz);
				$("#accusation-quizNo").val(quizVo.no);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("#accusation-submit").on("click", function() {
		var quizNo = $("#accusation-quizNo").val();
		var reason = $("#accusation-reason").val();
		
		var vo = {
			"keyNo" : quizNo, 
			"reason" : reason,
		}
		
		if (reason == "") {
			alert("이유를 입력해주세요");
			$("#accusation-reason").focus();
			return false;
		}
		
		$.ajax({
			url : "/readingbetter/book/quizAccusation",
			type : "POST",
			data : JSON.stringify(vo),
			contentType : "application/json",
			dataType : "json",
			success : function(vo) {
				alert("접수되었습니다");
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});