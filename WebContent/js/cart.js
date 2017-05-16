
var cargo =2;

window.onload = function (){
	for (var i = 1; i <= cargo; i++){
		calSubtotal(i);
	}
}

function cargoAdd(var1)
{
	var cargonumber=document.getElementById("cargoqtty"+var1);
	cargonumber.value = parseInt(cargonumber.value)+1;
	cargoCheck(var1);
}

function cargoMinus(var1)
{
	var cargonumber=document.getElementById("cargoqtty"+var1);
	cargonumber.value = parseInt(cargonumber.value)-1;
	cargoCheck(var1);
}

function cargoCheck(var1)
{
	var cargonumber=document.getElementById("cargoqtty"+var1);
	var val = parseInt(cargonumber.value);
	if(isNaN(val)){
		alert("请输入数字");
		val = 1;
	}
	if (val <= 0) {
		val = 1;
	}
	if (val >= 99) {
		val = 99;
	}
	if (cargonumber.value != val) {
		cargonumber.value = val;
	}
	calSubtotal(var1);
	calTotal(); 
}

function calSubtotal(var1){
	var cargoPrice = document.getElementById("price"+var1);
	var cargoprice = parseInt(cargoPrice.innerText);
	var cargoNumber = document.getElementById("cargoqtty"+var1);
	var cargonumber = parseInt(cargoNumber.value);
	var cargoSubtotal = document.getElementById("subTotal"+var1);
	cargoSubtotal.innerText = cargoprice * cargonumber;
}

function calTotal(){
	var cargoTotal = document.getElementById("total");
	var total = 0;
	for (var i = 1; i <= cargo; i++){
		var cargoCheck = document.getElementById("cargocheck"+i);
		if(cargoCheck.checked){
			var subtotal = document.getElementById("subTotal"+i);
			total = total + parseInt(subtotal.innerText);
		}
	}
	cargoTotal.innerText = total;
}

function checkAll(){
	var cargoCheckAll = document.getElementById("cargocheckall");
	if(cargoCheckAll.checked){
		for (var i = 1; i <= cargo; i++){
			var cargoCheck = document.getElementById("cargocheck"+i);
			cargoCheck.checked = true;
		}
	}else{
		for (var i = 1; i <= cargo; i++){
			var cargoCheck = document.getElementById("cargocheck"+i);
			cargoCheck.checked = false;
		}
	}
	calTotal();
}

function checkAllCheck(var1){
	var cargoCheck = document.getElementById("cargocheck"+var1);
	var cargoCheckAll = document.getElementById("cargocheckall");
	if(!cargoCheck.checked){
		cargoCheckAll.checked = false;
	}else{
		var flag = 1;
		for (var i = 1; i <= cargo; i++){
			var cargoCheck = document.getElementById("cargocheck"+i);
			if(!cargoCheck.checked){
				flag = 0;
			}
		}
		if(flag==1){
			cargoCheckAll.checked = true;
		}
	}
	calTotal();
}



