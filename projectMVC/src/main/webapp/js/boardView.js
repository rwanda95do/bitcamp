$(function(){
	// 자신이 작성한 글만 수정/삭제 가능하게하기
	alert($('#memId').val());
	alert($('#id').text());
	
	if($('#memId').val() == $('#id').text()) {
		$('#boardViewSapn').show();
	} else {
		$('#boardViewSapn').hide();
	}
	
	
	// 글 수정
	$('#boardUpdateFormBtn').click(function(){
		$('#boardViewForm').attr('action', '/projectMVC/board/boardUpdateForm.do');
		$('#boardViewForm').submit(); 		// seq, pg를 가지고 이동 -> 반드시 name속성이 있어야한다.
	});
	
	// 글 삭제 - 글을 삭제한 후에는 무조껀 1페이지를 보여주기 때문에 pg를 신경쓰지않는다.
	$('#boardDeleteFormBtn').click(function(){
		$('#boardViewForm').attr('action', '/projectMVC/board/boardDeleteForm.do'); 		// 비밀번호를 물어봐서 맞으면 삭제한다
		$('#boardViewForm').submit(); 		// seq 가지고 이동, 근데 submit걸었으니까 둘다 가지고 이동
		
	});
});