var username = undefined;
var password = undefined;

function checkUserName() {

    username = document.getElementById("username").value;
    var userShow = document.getElementById("userShow");

    if (username.length >= 3 && username.length <= 15) {
        //符合长度要求
        //1：不是数字开头的
        var c = username.charAt(0);
        if (isNaN(c)) {
            //非数字开头--符合要求
            userShow.innerText = "用户名验证通过";
            userShow.style.color = "#b6ffb2";
            return true;
        } else {
            //数字开头
            userShow.innerText = "*用户名不能以数字开头";
            userShow.style.color = "#ff798d";
            return false;
        }


    } else { //不符合长度要求
        userShow.innerText = "*用户名长度不符合要求(3~15位非数字开头)";
        userShow.style.color = "#ff798d";
        return false;
    }
}

function checkPassword() {
	password = document.getElementById("password").value;
	var userShow = document.getElementById("userShow");

	if (password.length >= 3 && password.length <= 15) {
		//1:纯数字
		var pwdReg = /(\D+\d+) |(\d+\D)/;

		if (pwdReg.test(password)) {
			userShow.innerText = "密码验证通过";
			userShow.style.color = "#b6ffb2";
			return true;
		} else {
			userShow.innerText = "*密码不能是纯字符";
			userShow.style.color = "#e0a2ff";
			return false;
		}
	} else {
		userShow.innerText = "*密码长度不符合要求(3~15位)";
		userShow.style.color = "#e0a2ff";
		return false;
	}
}

function regist() {
    if (checkUserName() && checkPassword())
        alert("恭喜用户 " + username + " 验证成功，准备注册！\n您的密码：" + password);
}