<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<style>
#layer_newbook {
	z-index: 5;
	position: absolute;
	top: 30%;
	left: 0px;
	width: 100%;
}

#popup {
	z-index: 6;
	position: absolute;
	text-align: center;
	left: 30%;
	top: 30%;
	width: 700px;
	height: 300px;
	background-color: white;
	border: 3px solid #EAEAEA;
}

#image_newbook {
	z-index: 7;
}

#close {
	z-index: 4;
	float: right;
}

#news_page {
	background-color: #EAEAEA;
	font-family: monospace;
	color: navy;
	.
	customNotPadding
	{ /* border 0 */
	padding
	:
	0
	0
	0
	0;
}




</style>

<!--  <script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->

<script type="text/javascript">
	//창 닫기//////////////////////////////////////
	/*  	 	$(document).ready(function() {
	 $('#exit').click(function() {
	 $('#popup').hide();
	 });
	 });   */
	/////////////////////////////////////////////    
	//오늘 하루 닫기
	/////////////////////////////////////////////////////////////////
	$(document).ready(function() {

		cookiedata = document.cookie;

		if (cookiedata.indexOf("ncookie=done") < 0) {

			document.getElementById('layer_newbook').style.display = "block";

		} else {

			document.getElementById('layer_newbook').style.display = "none";
		}
	});

	function setCookie(name, value, expiredays)

	{

		var todayDate = new Date();

		todayDate.setDate(todayDate.getDate() + expiredays);

		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"

	}

	function closeWin()

	{

		document.getElementById('layer_newbook').style.display = "none";

	}

	function todaycloseWin()

	{

		setCookie("ncookie", "done", 1);

		document.getElementById('layer_newbook').style.display = "none";

	}

	function popup() {
		$("#layer_newbook").hide('fade');
	}

	///////////////////////////////////////////////////////////////////////
	 $( init );
	 function init() {  $('#layer_newbook').draggable();
	 } 
//팝업창 드래그
/* 	 $(document).ready(function() {

		$(".layer_newbook").draggable();

	});  */

	/////////////////////////////////////////////////////////////////////
	
	

	//////////////북토피아 투데이 뉴스///////////////////////////////////////  	
	var accordionZoneFlag = true; // true : 열기, false : 닫기
	function accordionZoneControl() {
		if (accordionZoneFlag) {
			$("#ACCORDION_ZONE").slideDown(400, function() {
				accordionZoneFlag = false;
				$("#ACCORDION_ZONE_DOWN").css("display", "none");
				$("#ACCORDION_ZONE_UP").css("display", "");
			});
		} else {
			$("#ACCORDION_ZONE").slideUp(400, function() {
				accordionZoneFlag = true;
				$("#ACCORDION_ZONE_DOWN").css("display", "");
				$("#ACCORDION_ZONE_UP").css("display", "none");
			});
		}
	}
	////////////////////////////////////////////////////////////////////

	
	
	</script>



<div id="ad_main_banner">
	<ul class="bjqs">
		<li><img width="775" height="145"
			src="${pageContext.request.contextPath}/resources/image/main_banner1.jpg"></li>
		<li><img width="775" height="145"
			src="${pageContext.request.contextPath}/resources/image/main_banner2.jpg"></li>
		<LI><img width="775" height="145"
			src="${pageContext.request.contextPath}/resources/image/main_banner3.jpg"></LI>
	</ul>
</div>

<br>
<div class="content" data-role="content">
	<ul data-role="listview" data-inset="true">
		<li>
			<div id="news_page">
				<br> <a href="#"><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BookTopia
						TODAY NEWS</h1></a><a></a> <br>
			</div>
		</li>
		<li id="ACCORDION_ZONE" style="display: none;"><a href="#">[Science
				&] `슈퍼문` 뜨는 14일 밤…지구에선 무슨 일이</a><br />
		<br /> <a href="#">두달된 사은품을 미개봉 반납하라니…" 갤노트7 고객 불만</a><br />
		<br /> <a href="#">트럼프 얼굴 새겨진 황금 아이폰 등장</a><br />
		<br /> <a href="#"> 아이폰에서 '시리'로 페이팔 송금 가능해진다</a><br />
		<br /> <a href="#">어도비, 동영상 광고 업체 '튜브모굴' 인수</a><br />
		<br /> <a href="#">준비 덜 된 지상파UHD..."망신만 당하는거 아닌가"</a><br />
		<br /> <a href="#">네이버 vs 카카오, 내년 모바일광고 '진검승부' </a><br />
		<br /> <a href="#">[IT애정남] PDF 편집도구, 유료와 무료 프로그램의 차이는?</a><br />
		<br /> <a href="#">더보기</a><a></a>
			<h6>(본 콘텐츠의 저작권은 제공처 또는 북토피아에 있으며 이를 무단 이용하는 경우 저작권법 등에 따라 법적책임을
				질 수 있습니다.)</h6></li>
		<li data-icon="false"><a
			href="javascript:accordionZoneControl();" class="customNotPadding">
				<div id="ACCORDION_ZONE_DOWN" align="center" style="height: 20px;">
					<h2>펼쳐 보기</h2>
				</div>
				<div id="ACCORDION_ZONE_UP" align="center"
					style="height: 20px; display: none">
					<h2>닫기</h2>
				</div>
		</a></li>
	</ul>
</div>

<br>
<br>
<div class="main_book">
	<c:set var="goods_count" value="0" />
	<h3>베스트셀러</h3>
	<c:forEach var="item" items="${goodsMap.bestseller }">
		<c:set var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a
				href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
				<img class="link"
				src="${pageContext.request.contextPath}/resources/image/1px.gif">
			</a> <img width="121" height="154"
				src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">

			<div class="title">${item.goods_title }</div>
			<div class="price">
				<fmt:formatNumber value="${item.goods_price}" type="number"
					var="goods_price" />
				${goods_price}원
			</div>
		</div>
	</c:forEach>
	<c:if test="${goods_count==15   }">
		<div class="book">
			<font size=20> <a href="#">more</a></font>
		</div>
	</c:if>
</div>
<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117"
		src="${pageContext.request.contextPath}/resources/image/sub_banner2.jpg">
</div>
<div class="main_book">
	<c:set var="goods_count" value="0" />
	<h3>새로 출판된 책</h3>
	<c:forEach var="item" items="${goodsMap.newbook }">
		<c:set var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a
				href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
				<img class="link"
				src="${pageContext.request.contextPath}/resources/image/1px.gif">
			</a> <img width="121" height="154"
				src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			<div class="title">${item.goods_title }</div>
			<div class="price">
				<fmt:formatNumber value="${item.goods_price}" type="number"
					var="goods_price" />
				${goods_price}원
			</div>
		</div>
	</c:forEach>
	<c:if test="${goods_count==15   }">
		<div class="book">
			<font size=20> <a href="#">more</a></font>
		</div>
	</c:if>
</div>

<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117"
		src="${pageContext.request.contextPath}/resources/image/sub_banner1.jpg">
</div>

<div class="main_book">
	<c:set var="goods_count" value="0" />
	<h3>스테디셀러</h3>
	<c:forEach var="item" items="${goodsMap.steadyseller }">
		<c:set var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a
				href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
				<img class="link"
				src="${pageContext.request.contextPath}/resources/image/1px.gif">
			</a> <img width="121" height="154"
				src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			<div class="title">${item.goods_title }</div>
			<div class="price">
				<fmt:formatNumber value="${item.goods_price}" type="number"
					var="goods_price" />
				${goods_price}원
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${goods_count==15  }">
	<div class="book">
		<font size=20> <a href="#">more</a></font>
	</div>
</c:if>
<div class="clear"></div>

<c:forEach var="item" items="${goodsMap.popupList}">

	<div id="layer_newbook" class="layer_newbook"
		style="visibility: visible">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:popup()" id="exit"
				onClick="javascript:fn_display_detail('close', '.layer_review');">


				<img
				src="${pageContext.request.contextPath}/resources/image/close.png"
				id="close" />
			</a><br />

			<h3>BookTopia Weekly Best 5</h3>
			<font size="5" id="contents"><p id="message">
					${item.popup_message }</p> </font> <br>
			<div id="image_newbook">
				<a href="javascript:test()"> <img width=170 height=190
					src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.popup_imagename}">

				</a>
				<div>
					<a href="javascript:todaycloseWin()" class="white">오늘하루 그만보기</a> <a
						class="pull-right white" href="javascript:closeWin();">닫기</a>
				</div>

			</div>
		</div>
</c:forEach>







