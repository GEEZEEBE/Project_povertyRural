var mHeight = '';
var mWeight = '';
var mObesity = '';
var mTemperature = '';
var mSystol = '';
var mDiastol = '';
var mUserName = '';

$(function(){
});

$(document).ready(function(){	
	
	var temp = location.search.split("?");	
	var data = temp[1].split("&");
	var arraydata = new Array(7);
	for(var i = 0 ; i < data.length ; i++) {
		arraydata[i] = data[i].split("=")[1];
		//console.log(arraydata[i]);
	}
	
	mUserName = arraydata[0];
	mHeight = arraydata[1]==''?'-':arraydata[1];
	mWeight = arraydata[2]==''?'-':arraydata[2];
	mObesity = arraydata[3]==''?'-':arraydata[3];
	mTemperature = arraydata[4]==''?'-':arraydata[4];
	mSystol = arraydata[5]==''?'-':arraydata[5];
	mDiastol = arraydata[6]==''?'-':arraydata[6];
	
	var date = new Date();
	var dateSet = leadingZeros(date.getFullYear(),4) + '.' + leadingZeros(date.getMonth() + 1,2) + '.' + leadingZeros(date.getDate(),2);
	
	$("#name").html(mUserName);
	$("#date").html(dateSet);
	$("#height").html(mHeight);
	$("#weight").html(mWeight);
	$("#obesity").html(mObesity);
	$("#temperature").html(mTemperature);
	$("#systol").html(mSystol);
	$("#diastol").html(mDiastol);
});

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (var i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}