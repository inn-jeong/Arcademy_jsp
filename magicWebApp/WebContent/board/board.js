function check_ok(){
	if(document.reg_frm.b_name.value.length == 0){
		alert("작성자를 입력해주세요.");
		reg_frm.b_name.focus();
		return;
	}
	if(reg_frm.b_title.value.length == 0){
		alert("제목을 입력해주세요.");
		reg_frm.b_title.focus();
		return;
	}
	if(reg_frm.b_content.value.length == 0){
		alert("내용을 입력해주세요.");
		reg_frm.b_content.focus();
		return;
	}
	reg_frm.submit();
}