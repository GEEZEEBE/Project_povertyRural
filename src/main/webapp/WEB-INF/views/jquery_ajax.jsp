<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>

<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>

<script type="text/javascript">
	function onSelectChange(){
		var selected = $("#developer option:selected");    
		var temp = "";
		if(selected.val() != 0){
			temp = "You Selected " + selected.text();
		}
		$("#output1").html(temp);
	}

	function fCallservice(divide) {
//	    var q =
		var selected = $("#developer option:selected");    
				$.ajax({
					url: '${pageContext.request.contextPath}/ws/common/login/'+divide,
					type: 'get',
					data : { name: selected.text() },
					contentType: 'application/json; charset="utf-8"',
					success: function(data) {
						alert(data);
 					},
 					beforeSend : function() {
 						//처리중 화면구성
 					},
 					error : function() {
 						alert("정보를 가져오는데 실패하였습니다.");
 					} 					
				});
//	    alert(q);
	}
	
	function Prmtservice() {
		var mycars = new Array();	// List

//		var myArray = new Array();	// Map
/* 
		var h = new Hash();

		h.set("key01", "value");
		h.set("key02", "value");
		h.set("key03", "value");

		mycars[0] = h;

		myArray.push('one');
		myArray.push('two');
		myArray.push('three');

		mycars[1] = h;
		
		myArray.push('one');
		myArray.push('two');
		myArray.push('three');

		mycars[2] = h;
 */
/*  
		var mycars = new Array();

 		mycars[0] = '{"guid_cnts_url":"templeteGuide001.pdf","frst_rgst_dt":2013-03-14 22:04:13.0,"guid_smmr":"This is Templete guide","guid_id":"test01","del_yn":"Y","guid_titl":"Templete Guide 001","frst_rgst_mngr_id":"admin001","guid_type":"E","last_crct_dt":2013-02-18 10:47:37.0,"last_crct_mngr_id":"admin001","guid_lang":"null"}'; 		             
		mycars[1] = '{"guid_cnts_url":"templeteGuide001.pdf","frst_rgst_dt":2013-03-14 22:04:13.0,"guid_smmr":"This is Templete guide","guid_id":"test02","del_yn":"Y","guid_titl":"Templete Guide 001","frst_rgst_mngr_id":"admin001","guid_type":"E","last_crct_dt":2013-02-18 10:47:37.0,"last_crct_mngr_id":"admin001","guid_lang":"null"}';
		mycars[2] = '{"guid_cnts_url":"templeteGuide001.pdf","frst_rgst_dt":2013-03-14 22:04:13.0,"guid_smmr":"This is Templete guide","guid_id":"test03","del_yn":"Y","guid_titl":"Templete Guide 001","frst_rgst_mngr_id":"admin001","guid_type":"E","last_crct_dt":2013-02-18 10:47:37.0,"last_crct_mngr_id":"admin001","guid_lang":"null"}';
 */
/*  
 var map = {'myKey1':'myObj1', 'mykey2':'myObj2'};
 mycars[0] = map;
 */ 
/* 
 function fuzzyPlural(single) {
	  var result = single.replace(/o/g, 'e');  
	  if( single === 'kangaroo'){
	    result += 'se';
	  }
	  return result; 
	}
	 
	var words = ["foot", "goose", "moose", "kangaroo"];
	alert(words.map(fuzzyPlural));
	
	mycars[0] = words.map(fuzzyPlural);
	mycars[1] = words.map(fuzzyPlural);
	mycars[2] = words.map(fuzzyPlural);
	mycars[3] = words.map(fuzzyPlural);
	 
 */
	var mycars= null;

		//mycars[0] = '{"img1_widt_heig":"111,111","temp_html":"aa1.html","dflt_yn":"N","img_cnt":1,"temp_titl":"1111","temp_img":"Desert2.jpg","del_yn":"Y","temp_id":"lsh1","temp_type":"P","text_cnt":111,"temp_lang":"E","img2_widt_heig":"","img3_widt_heig":""}'; 		             
		//mycars[1] = '{"img1_widt_heig":"111,111","temp_html":"aa1.html","dflt_yn":"N","img_cnt":1,"temp_titl":"1111","temp_img":"Desert2.jpg","del_yn":"Y","temp_id":"lsh2","temp_type":"P","text_cnt":111,"temp_lang":"E","img2_widt_heig":"","img3_widt_heig":""}';
		//mycars[2] = '{"img1_widt_heig":"111,111","temp_html":"aa1.html","dflt_yn":"N","img_cnt":1,"temp_titl":"1111","temp_img":"Desert2.jpg","del_yn":"Y","temp_id":"lsh3","temp_type":"P","text_cnt":111,"temp_lang":"E","img2_widt_heig":"","img3_widt_heig":""}';
		
		//mycars[0] = '{"prmt_lvl_type":"A","prmt_id":"4","del_yn":"N","prmt_type":"P","prmt_lvl":"1","user_id":"lsh01","temp_id":"20130311211415335","prod":"U","prmt_prod_img":"pr_banana_001.jpg"}';
		//mycars = '[{"prmt_id": "5","prmt_txt_id": "113229124517241","prod_titl": "g","txt_cnts3": "","txt_cnts2": "","txt_cnts1": "g","sub_titl1": "H","txt_cnt": 1,"sub_titl3": "","sub_titl2": ""},{"prmt_id": "113229124517211","prmt_txt_id": "113229124517242","prod_titl": "g","txt_cnts3": "","txt_cnts2": "","txt_cnts1": "g","sub_titl1": "H","txt_cnt": 1,"sub_titl3": "","sub_titl2": ""}]';

		//mycars[0] = '{prmt_txt_id%22%3A%2211322944237735%22%2C%22txt_cnts1%22%3A%22g%22%2C%22txt_cnts2%22%3A%22%22%2C%22txt_cnts3%22%3A%22%22%2C%22sub_titl2%22%3A%22%22%2C%22prod_titl%22%3A%22g%22%2C%22sub_titl3%22%3A%22%22%2C%22txt_cnt%22%3A1%2C%22sub_titl1%22%3A%22v%22%2C%22prmt_id%22%3A%2211322944237716%22%7D}';
		//mycars = '[{"prmt_lvl_type":"A","prmt_id":"11323153143930","del_yn":"N","prmt_type":"P","prmt_lvl":"1","user_id":"lsh02","temp_id":"20130311202502668","prod":"I","prmt_prod_img":"pr_banana_001.jpg"},{"prmt_lvl_type":"A","prmt_id":"6","del_yn":"N","prmt_type":"P","prmt_lvl":"1","user_id":"lsh03","temp_id":"201303112114153352","prod":"I","prmt_prod_img":"pr_banana_001.jpg"}]';		
          
		//mycars[0] = '{"prmt_id":"1","del_yn":"N","sns_hs_id":"10010","prmt_sns_id":"316766313034969088","prmt_sns_url":"www.twitter.com\/abc\/tester\/lsh1","sns_id":"abc@twitter.com","sns_stat":"S","prod":"U","sns_type":"T"}';
        //mycars[1] = '{"prmt_id":"1","del_yn":"N","sns_hs_id":"10011","prmt_sns_id":"5940805647703182993","prmt_sns_url":"www.google.com\/blog\/tester\/lsh1","sns_id":"abc@blogspot.com","sns_stat":"S","prod":"U","sns_type":"B"}';
        //mycars[2] = '{"prmt_id":"1","del_yn":"N","sns_hs_id":"10012","prmt_sns_id":"373896699391162","prmt_sns_url":"www.facebook.com\/tester\/lsh1","sns_id":"abc@facebook.com","sns_stat":"S","prod":"U","sns_type":"F"}';
          
        //mycars[0] = '{"guid_cnts_url":"templeteGuide001.pdf","guid_smmr":"This is Templete guide","guid_id":"6","del_yn":"Y","guid_titl":"Templete Guide 001","frst_rgst_mngr_id":"admin001","guid_type":"E","last_crct_mngr_id":"admin001","prod":null,"guid_lang":null}';
          
        //mycars[0] = '{"prod_pric":"1$","prod_nm":"banana","tlno":"010-2341-2341","emal":"seller@gmail.com","prmt_txt_id":"5","prmt_id":"5","prod_pack":null,"prod_orgn":null,"prod_sllr":"seller name","prod_titl":"banana sell","txt_cnts3":null,"txt_cnts2":null,"txt_cnts1":"aaaaaa","sub_titl1":null,"txt_cnt":1,"sub_titl3":null,"prod":null,"sub_titl2":null}';
          
          
          
          
          
alert('Prmtservice()');
//		$.getJSON('${pageContext.request.contextPath}/ws/common/commerce/InGuidList', 
//		$.post('${pageContext.request.contextPath}/ws/common/commerce/InPrmtList',
//		$.getJSON('${pageContext.request.contextPath}/ws/common/commerce/InTempList',		
//		$.getJSON('${pageContext.request.contextPath}/ws/common/commerce/InSnshsList',	
//		$.post('${pageContext.request.contextPath}/ws/common/commerce/InPrmttxtList',
//		$.getJSON('${pageContext.request.contextPath}/ws/common/commerce/InPrmtimgList',
		$.getJSON('${pageContext.request.contextPath}/ws/common/commerce/InPrmtList',
				
				{keyList: mycars},
			function(data) {
					alert(data);
			});
	}

	/*
	*	callBackURL : call URL
		parameterID01 : parameter 01
		parameterID02 : parameter 02
		outID : tag ID
		outTagType : tag Type (ex.select, radio ..)
		outBuilType : buill type (ex.whole, part) - current unsuing
		outTagID, onChangeFunction
	*/
	function fgetGetCommonByDivide(callBackURL, parameterID01, parameterID02, outID, outTagType, outBuilType, outTagID, onChangeFunction) {
//		var selected = $("#developer option:selected");    
		var selected = parameterID01;    
		$.getJSON(callBackURL, 
				{ keyID: selected },
			function(data) {
					alert('divide: '+data.divide+', age: '+data.age+', items: '+data.items);
					var temp = '<select id="'+outID+'" onChange="'+onChangeFunction+'">';
			     	$.each(data.itmes, function(i,item){
			     		temp += '<option value="'+item.commonCodeID+'">'+item.codeName+'</option>';
			   		});
					temp += '</select>';
				$("#output1").html(temp);
			});
	}

	function fgetSelectTag(callBackURL, keyID, outID, onChangeFunction) {
		
		var selected = keyID != null ? keyID : $("#"+outID+" option:selected");    

		$.getJSON(callBackURL, 
				{ keyID: selected },
			function(data) {
					//alert('divide: '+data.divide+', age: '+data.age+', items: '+data.items);
					// wrong $("#"+outID).bind("change", onChangeFunction);
			     	$.each(data.itmes, function(i,item){
			     		$("#"+outID).append( new Option(item.codeName,item.commonCodeID));
//			     		temp += '<option value="'+item.commonCodeID+'">'+item.codeName+'</option>';
			   		});
//					temp += '</select>';
//					alert(temp);
//				$("#"+outTagID).html(temp);
			});
	}		
		
	function fCallservice(divide, nmbrID, endYN, userID) {
//	    var q =
		var selected = $("#developer option:selected");    
				$.ajax({
					url: '${pageContext.request.contextPath}/ws/common/login/'+divide,
					type: 'get',
					data : { USER_ID: userID, PW:'0103', MACADDRESS:'11:33:22:33:44:55', USE_HS_NMBR_ID:nmbrID, END_YN:endYN},
					contentType: 'application/json; charset="utf-8"',
					success: function(data) {
						alert(data);
 					},
 					beforeSend : function() {
 						//처리중 화면구성
 					},
 					error : function() {
 						alert("정보를 가져오는데 실패하였습니다.");
 					} 					
				});
//	    alert(q);
	}
		
</script>		
<body>
	<h1>
		  
	</h1>
	<ul>
		<li>
			<a href="#" onClick="fCallservice('ELWHITEBOARD','','S','kut0100')">TEST Insert Interactive White board('ELWHITEBOARD','','S','kut0100')</a></br> 
			<a href="#" onClick="fCallservice('ELWHITEBOARD','20130306114415034517','E','kut0100')">TEST Update Interactive White board('ELWHITEBOARD','20130306114415034517','E','kut0100')</a> </br>
			<a href="#" onClick="fCallservice('PCAGENCY','D8:D3:85:CF:8A:03','S','kut0103')">TEST Insert PCAGENCY('PCAGENCY','D8:D3:85:CF:8A:03','S','kut0103')</a> </br>
			<a href="#" onClick="fCallservice('PCAGENCY','20130306115236054044','E','kut0100')">TEST Insert PCAGENCY('PCAGENCY','20130306115236054044','E','kut0100')</a></br> 
			<a href="#" onClick="fCallservice('PCAGENCY','','E','kut0220')">TEST Error PCAGENCY('PCAGENCY','','E','kut0220')</a> </p>
			<a href="#" onClick="Prmtservice()"><b>Commerce TEST</b></a>
		</li>
	</ul>
	<ul>
		<li><div id="output1"></div><div id="output2"></div></li>
	</ul>
	<ul>
		<li>
			<a href="#" onClick="fCallservice('ELWHITEBOARD')">TEST Call fCallservice</a> 
			<a href="#" onClick="fgetGetCommonByDivide('${pageContext.request.contextPath}/ws/common/commonCode','00100','','outID','select','','output1','')">Call fgetGetCommonByDivide</a>
		</li>
	</ul>
	<ul>
		<li>
			<h3>Designers</h3>
			<!-- modify here -->
			<select id="designers" onChange="fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00100','publishers','');">
			</select>
		</li>
		<li>
			<h3>Publishers</h3>
			<!-- modify here -->
			<select id="publishers" onChange="fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00100','developers','');">
			</select>
		</li>
		<li>
			<h3>Developers</h3>
			<select id="developers" onChange="">
			</select>
		</li>
	</ul>
<!-- modify here -->
<script type="text/javascript">
	fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00100','designers',''); 	
</script>	
</body>
</html>
