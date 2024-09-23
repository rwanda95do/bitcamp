/* js파일에서는 현재 session값을 가져올 방법이 없다. 
	그래서 input태그를 이용해서 memId를 설정해서 값을 가져오는 방법을 사용한다.
	
	나중에 무슨 시큐리티 어쩌고를 하면 쓸수도 있다고하는데.. 잘 모르겠다. 
*/

$('.subjectA').click(function() {
	if($('#memId').val()=='') {
		alert('먼저 로그인 해주세요');
	} else {
//		alert('seq : ' + $(this).parent().prev().prop('tagName'));
		alert('seq : ' + $(this).parent().prev().text());
		alert('pg : ' + $('#pg').val());
		
		let seq = $(this).parent().prev().text();
		let pg =$('#pg').val();
		
		
		location.href = '/projectMVC/board/boardView.do?pg='+pg + '&seq=' + seq;
	}
});