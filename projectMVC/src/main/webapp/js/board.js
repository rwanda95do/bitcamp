$('#writeBtn').click(function(){
	if($('#subject').val() == ''){
		alert('제목을 입력하세요.');
		$('#subject').focus();
	} else if($('#content').val()==''){
		alert('내용을 입력하세요.');
		$('#content').focus();
	} else {
		$.ajax({
			type: "post",
			url: "/projectMVC/board/boardWrite.do" ,
			data:{
				"subject": $('#subject').val(),
				"content": $('#content').val()
			},
			success: function(){
				alert("게시글 작성 완료!!");
				location.href="/projectMVC/board/boardList.do?pg=1";
			},
			error: function(e){
				console.log(e);
			}
		});
	}
});