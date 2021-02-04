<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>Document</title>
        <style>
       		body{
       			width: 958px;
       			margin: auto;
       		}
            .centerText{
                text-align: center;
            }
            .centerTextTitle{
                margin-top: 84px;
                margin-bottom: 20px;
            }
            .centerTextSubtitle{
                margin-bottom: 72px;
            }
            #button_group1{width: 38%; float: left;}
            #button_group2{width: 38%; float: left;}
            #button_group3{width: 24%; float: right;}
            .menu{/*pupose title단*/
                border: 1.3px solid;
                width: 290px;
                height: 44px;
                font-size: 18px;
                padding-left: 30px;
                padding-top: 20px;
                display: inline-block;
            }
            .hide{/*pupose list단*/
                width: 290px;
                border: 1.3px solid;
                border-top: none;
                list-style: none;
                display:none;
                padding-left: 30px;
                margin-top: 0px;
                font-size: 18px;
                background-color: #fefef4;
            }.hide li{
                list-style: none;
                padding: 18px 0px;
            }
            .hide a:hover{
                color: #003cff;
            }
            .selected{/*에 쓸거에요. , 필요해요.*/
                display: none;
                font-size: 18px;
            }
            /* 아랫방향 화살표 */
            .arrow_bottom span{
                content: '';
                width: 20px; /* 사이즈 */
                height: 20px; /* 사이즈 */
                border-top: 1px solid #121212; /* 선 두께 */
                border-right: 1px solid #121212; /* 선 두께 */
                display: block;
                transform: rotate(135deg); /* 각도 */
                float: left;
                margin-top: -30px;
                margin-left: 250px;
            }
            /* 아랫방향 화살표 */

            .makeDT{/*만들기 버튼*/
                width: 219px;
                height: 42px;
                margin-top: 10px;
                display: inline-block;
                border: 1px solid #003cff;
                font-size: 18px;
                color: #003cff;
                border-radius: 8px;
                box-shadow: 3px 3px 3px 0 rgba(0, 0, 0, 0.32);
                background-color: #fff;
                outline: none;
            }
            .textLine{
            	margin-top: 376px;
            	margin-bottom: 70px;
            }
            #copyBtn{
            	float: right;
            }
            #dummyText{
            	width:90%;
            	height:200px;
            	overflow: auto;
            	font-size: 18px;
            	color: #666;
            }
            #dummyText >p{
            	margin: 0px;
            }
            #last_3btn{
            	margin-top: 20px;
            }
            .afterTextBtn{
            	width: 172px;
  				height: 40px;
  				border: solid 1.3px;
            	border-radius: 8px;
            	font-size: 18px;
            	outline: none;
            }
            #contactUs{
            	float: right;
            }
            
            footer{
                position: absolute;
                top: 898px;
                bottom: 44px;
                width: 958px;
                text-align: center;
                clear: both;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        $(document).ready(function(){
            $(".purposeMenu").click(function(){//슬라이드 이벤트
                
                var submenu = $(".hidePurposelist");
                
                if( submenu.is(":visible") ){
                    // $(".hidePurposelist").css("display", "none");
                    // $(".menu").css("border-bottom", "1px solid");//슬라이드 아닌 그냥 사라지게
                    submenu.slideUp();
                }else{
                    submenu.slideDown();
                }
            });
            $(".volumeMenu").click(function(){
                
                var submenu = $(".hideVolumelist");
                
                if( submenu.is(":visible") ){
                    // $(".hidePurposelist").css("display", "none");
                    // $(".menu").css("border-bottom", "1px solid");//슬라이드 아닌 그냥 사라지게
                    submenu.slideUp();
                }else{
                    submenu.slideDown();
                }
            });
        });
        var purpose;
        <c:set var="purpose" value="${requestScope.purpose}"/>
		    	<c:if test="${!empty purpose}">
		    		purpose = "${purpose}";
		    	</c:if>
        var volume;
        <c:set var="volume" value="${requestScope.volume}"/>
        		<c:if test="${!empty volume}">
		    		volume = ${volume};
		    	</c:if>
        
        function selectPurpose(i){//셀렉트 이벤트
                if(i == 1){
                    purpose ="전자제품";
                }else if(i == 2){
                    purpose ="생활용품/잡화";
                }else if(i == 3){
                    purpose ="포스터/공모전";
                }
                if(!$(".selectedPupose").is(":visible")){
                    $(".selectedPupose").css("display","inline-block");
                }
                document.getElementById("purposeTitle").innerText = purpose;
                $(".purposeMenu").css("width","208px").css("display","inline-block");
                $("#purposeArrow").css("margin-left","162px");
                $(".hidePurposelist").css("width","208px");
                $(".hidePurposelist").slideUp();
        }
        function selectVolume(i){  //셀렉트 이벤트
        		volume = i;
        		var volumePrint;
        		if(volume == 1){
        			volumePrint="조금만"
        		}else if(volume == 2){
        			volumePrint="적당히"
        		}else if(volume == 3){
        			volumePrint="많이"
        		}
        		if(!$(".selectedVolume").is(":visible")){
                    $(".selectedVolume").css("display","inline-block");
                }
                document.getElementById("volumeTitle").innerText = volumePrint;
                $(".volumeMenu").css("width","208px").css("display","inline-block");
                $("#volumeArrow").css("margin-left","162px");
                $(".hideVolumelist").css("width","208px");
                $(".hideVolumelist").slideUp();
        }
        
        function createDTMBtn(){//텍스트 만들기 이벤트
        	var form = document.createElement('form');
        	form.setAttribute('method', 'get');
        	form.setAttribute('action', 'TextOutputAction.do');
        	document.charset = "utf-8";
        	
        	var purposeField = document.createElement('input');
        	purposeField.setAttribute('type', 'hidden');
        	purposeField.setAttribute('name', "purpose");
        	purposeField.setAttribute('value', purpose);
			form.appendChild(purposeField);
			document.body.appendChild(form);
			
			var volumeField = document.createElement('input');
			volumeField.setAttribute('type', 'hidden');
			volumeField.setAttribute('name', "volume");
			volumeField.setAttribute('value', volume);
			form.appendChild(volumeField);
			document.body.appendChild(form);
			form.submit();
            console.log("만들기 버튼 클릭됨.");
        }
        
        function copyText() {// 텍스트 복사
        	var obj = document.getElementById("dummyText");
        	
        	var range = document.createRange();
        	range.selectNode(obj.childNodes[0]); //텍스트 정보를 Range 객체에 저장
        	
        	var sel = window.getSelection();
        	sel.removeAllRanges(); //기존 선택정보 삭제
        	sel.addRange(range); //텍스트 정보 선택
        	
        	document.execCommand("copy"); //복사
        	sel.removeRange(range); //선택 정보 삭제
		}
        <c:set var="totalMnL" value="${requestScope.totalMnL}"/>
        	var moreVol;
        	<c:choose>
		    	<c:when test="${empty totalMnL}">
		    		totalMnL = 0;
		    	</c:when>
		    	<c:otherwise>
		    		totalMnL = ${totalMnL};
		    	</c:otherwise>
		    </c:choose>
        function MorLText(i) {//텍스트 추가 혹은 소거 요청
        	var form = document.createElement('form');
        	form.setAttribute('method', 'get');
        	form.setAttribute('action', 'TextOutputAction.do');
        	document.charset = "utf-8";
        	
        	var purposeField = document.createElement('input');
        	purposeField.setAttribute('type', 'hidden');
        	purposeField.setAttribute('name', "purpose");
        	purposeField.setAttribute('value', purpose);
			form.appendChild(purposeField);
			document.body.appendChild(form);
			
			var volumeField = document.createElement('input');
			volumeField.setAttribute('type', 'hidden');
			volumeField.setAttribute('name', "volume");
			volumeField.setAttribute('value', volume);
			form.appendChild(volumeField);
			document.body.appendChild(form);
			
			var totalMnLField = document.createElement('input');
			totalMnLField.setAttribute('type', 'hidden');
			totalMnLField.setAttribute('name', "totalMnL");
			totalMnLField.setAttribute('value', totalMnL);
			form.appendChild(totalMnLField);
			document.body.appendChild(form);
			
			var requestMnLField = document.createElement('input');
			requestMnLField.setAttribute('type', 'hidden');
			requestMnLField.setAttribute('name', "requestMnL");
			requestMnLField.setAttribute('value', i);
			form.appendChild(requestMnLField);
			document.body.appendChild(form);
			<c:set var="totalMnL" value="${requestScope.totalMnL}"/>
				<c:choose>
					<c:when test="${totalMnL eq 0}">
						if(i == 1){
							alert("제일 적은 양이에요.");
						}else{
							form.submit();
						}
					</c:when>
					<c:otherwise>
						form.submit();
				    </c:otherwise>
				</c:choose>
            console.log("조금 더, 너무 많아요 버튼 클릭됨.");
		}
        
        </script>
    </head>
    <body>
        <p class="centerText centerTextTitle" style="font-size: 26px; font-family: NotoSansKR-Bold;">텍스트 고민없이 디자인만 하세요.</p>
        <p class="centerText centerTextSubtitle" style="font-size: 15px; color: #444;">사소한 고민이 당신의 실행력을 방해할 수 없도록</p>

        <div class="button_group" id="button_group1">
            <div class="menu purposeMenu"> 
                <a id="purposeTitle">어디에 쓰실건가요?</a>
                <div class="arrow_bottom">
                    <span id="purposeArrow" class="arrow_bottom_span"></span>
                </div>
            </div>
                <span class="selected selectedPupose">에 쓸거에요.</span>
            <ul class="hide hidePurposelist">
                <li><a onclick="selectPurpose(1)">전자제품</a></li>
                <li><a onclick="selectPurpose(2)">생활용품/잡화</a></li>
                <li><a onclick="selectPurpose(3)">포스터/공모전</a></li>
            </ul>
        </div>

        <div class="button_group" id="button_group2">
            <div class="menu volumeMenu"> 
                <a id="volumeTitle">얼마나 필요하세요?</a>
                <div class="arrow_bottom">
                    <span id="volumeArrow"class="arrow_bottom_span"></span>
                </div>
            </div>
                <span class="selected selectedVolume">필요해요.</span>
            <ul class="hide hideVolumelist">
                <li><a onclick="selectVolume(1)">조금만 필요해요.</a></li>
                <li><a onclick="selectVolume(2)">적당히 필요해요.</a></li>
                <li><a onclick="selectVolume(3)">많이 필요해요.</a></li>
            </ul>
        </div>
        
        <c:set var="take_db" value="${requestScope.text}"/>
        <div class="button_group" id="button_group3">
	        <button class="makeDT" onclick="createDTMBtn()">
		        <c:choose>
		        	<c:when test="${empty take_db}">
		        		더미텍스트 만들기
		        	</c:when>
		        	<c:otherwise>
		        		다시 만들기
		        	</c:otherwise>
		        </c:choose>
	        </button>
        </div>
        
        <c:if test="${not empty take_db}">
        	<hr class="textLine">
        	<button id="copyBtn" onclick="copyText()">복사</button>
        
	        <div id="dummyText">
		        <c:forEach var="text" items="${requestScope.text}">
						${text}
				</c:forEach>
			</div>
			
			<div id="last_3btn">
				<button id="moreText" class="afterTextBtn" onclick="MorLText(0)">조금 더 필요해요</button>
				<button id="lessText" class="afterTextBtn" onclick="MorLText(1)">너무 많아요</button>
				<button id="contactUs" class="afterTextBtn">의견이 있어요</button>
			</div>
		</c:if>
        <footer style="font-size: 15px; color: #444;">SOFTEN PJT © MIB</footer>
			
	</body>
</html>