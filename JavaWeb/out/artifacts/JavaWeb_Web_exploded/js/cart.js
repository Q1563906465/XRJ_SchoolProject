function sum(){
	var num1 = document.getElementById("num1").value;
	var num2 = document.getElementById("num2").value;
	var num3 = document.getElementById("num3").value;
	var sum = parseFloat(num1*168) + parseFloat(num2*198) + parseFloat(num3*298);
	var number = document.getElementById("number");
	number.innerText = sum;
}

window.onload = function() {
	var btn = document.getElementById("all");
	btn.onclick = function() {
		var flag = this.checked;
		var items = document.getElementsByName("rad");
		for (var i = 0; i < items.length; i++) {
			items[i].checked = flag;//将所有item的状态设为全选按钮的状态
		}
	}
}