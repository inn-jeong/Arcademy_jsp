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
	if(reg_frm.b_pwd.value.length == 0){
		alert("비밀번호를 입력해주세요.");
		reg_frm.b_pwd.focus();
		return;
	}
	reg_frm.submit();
}

function delete_ok(){
	if(reg_frm.check_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		return;
	}
	reg_frm.submit();
}