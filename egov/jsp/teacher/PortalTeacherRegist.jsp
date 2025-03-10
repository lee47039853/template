<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

<title>내부업무 사이트 > 시민문화 관리 > 동아리 관리 > 강사 관리</title>

<script type="text/javascript" src="<c:url value="/js/EgovBBSMng.js" />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<%-- <validator:javascript formName="boardMaster" staticJavascript="false" xhtml="true" cdata="false"/> --%>
<script type="text/javascript">
	$(document).ready(function() {
	    // CKEditor 자동 인라인 편집 비활성화
	    CKEDITOR.disableAutoInline = true;
	
	    // CKEditor 4.16.2 보안 경고 메시지 화면에서 숨기기 (CSS 적용)
	    $("<style>.cke_notification_warning { display: none !important; }</style>").appendTo("head");
	
	    // CKEditor 4.16.2 보안 경고 메시지 콘솔에서 숨기기
	    (function() {
	        var originalWarn = console.warn;
	        console.warn = function(message) {
	            if (!message.includes("This CKEditor 4.16.2 version is not secure")) {
	                originalWarn.apply(console, arguments);
	            }
	        };
	    })();
	
	    // CKEditor 적용
	    if (typeof CKEDITOR !== 'undefined') {
	        if (CKEDITOR.instances['introduce']) {
	            CKEDITOR.instances['introduce'].destroy();
	        }
	        CKEDITOR.replace('introduce', {
	            height: 400,
	            language: 'ko' // 한국어 설정
	        });
	        console.log("CKEditor 로드 완료");
	    } else {
	        console.error("CKEditor가 로드되지 않았습니다.");
	    }
	});
    
    function fn_egov_validateForm(obj){
        return true;
    }
    
    function fn_egov_insert_teacherInf(){
		//일시적으로 주석처리
		/*
        if (!validateTeacherMaster(document.teacherMaster)){
            return;
        }
		*/
        
        if(confirm('<spring:message code="common.regist.msg" />')){
            document.teacherMaster.action = "<c:url value='/portal/teacher/InsertTeacherInf.do'/>";
            document.teacherMaster.submit();                  
        }
    }   
    
    function fn_egov_select_teacherList(){
        document.teacherMaster.action = "<c:url value='/portal/teacher/SelectTeacherList.do'/>";
        document.teacherMaster.submit();  
    }   
    
    
    function fn_egov_inqire_tmplatInqire(){
        
        var $dialog = $('<div id="modalPan"></div>')
    	.html('<iframe style="border: 0px; " src="' + "<c:url value='/cop/com/selectTemplateInfsPop.do'/>" +'" width="100%" height="100%"></iframe>')
    	.dialog({
        	autoOpen: false,
            modal: true,
            width: 1050,
            height: 950,
            title: "템플릿 목록"
    	});
        $(".ui-dialog-titlebar").hide();
    	$dialog.dialog('open');
    }
    
    function fn_egov_returnValue(retVal){
    	if(retVal != null){
            var tmp = retVal.split("|");
            document.getElementById("tmplatId").value = tmp[0];
            document.getElementById("tmplatNm").value = tmp[1];
        }
    	
    	fn_egov_modal_remove();
	}

    /**********************************************************
     * 모달 종료 버튼
     ******************************************************** */
    function fn_egov_modal_remove() {
    	$('#modalPan').remove();
    }
    
</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <!-- Header -->
		<c:import url="/sym/mms/EgovHeader.do" />
		<!--// Header -->

        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <!-- Left menu -->
						<c:import url="/sym/mms/EgovMenuLeft.do" />
						<!--// Left menu -->
        
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="/">Home</a></li>
                                        <li><a href="/portal/club/SelectClubList.do">시민문화관리</a></li>
                                        <li><a href="/portal/club/SelectClubList.do">동아리 관리</a></li>
                                        <li>강사 관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form:form modelAttribute="teacherMaster" name="teacherMaster" action="<c:url value='/portal/teacher/InsertTeacherInf.do'/>" method="post" >
								
								<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
								
                                <h1 class="tit_1">시민문화관리</h1>

                                <h2 class="tit_2">강사 관리</h2>
                                
                                <div class="board_view2">
                                    <table summary="강사이름,분야,전공,성별, ..입니다">
                                        <colgroup>
                                            <col style="width: 160px;">
                                            <col style="width: auto;">
                                            <col style="width: 160px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="encTeacherName">강사 이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <form:input path="encTeacherName" id="encTeacherName" title="강사이름" class="f_txt w_full" maxlength="60" />
                                                <form:errors path="encTeacherName" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="category1">분야 대분류</label>
                                            </td>
                                            <td>
                                                <label class="f_select" for="category1">
                                                    <form:select path="category1" id="category1" name="category1" title="대분류유형선택">
                                                        <form:option value='' label="선택하세요" selected="selected" />
                                                        <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <br/><form:errors path="category1" />
                                            </td>
                                            <td class="lb">
                                                <label for="category2">분야 소분류</label>
                                            </td>
                                            <td>
                                            	<label class="f_select" for="category2">
                                                    <form:select path="category2" id="category2" name="category2" title="대분류유형선택">
                                                        <form:option value='' label="선택하세요" selected="selected" />
                                                        <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <br/><form:errors path="category2" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="category3">대분류(서브)</label>
                                            </td>
                                            <td>
                                            	<label class="f_select" for="category3">
                                                    <form:select path="category3" id="category3" name="category3" title="대분류유형선택">
                                                        <form:option value='' label="선택하세요" selected="selected" />
                                                        <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <br/><form:errors path="category3" />
                                            </td>
                                            <td class="lb">
                                                <label for="categoryEtc">기타분류</label>
                                            </td>
                                            <td>
                                                <form:input path="categoryEtc" id="categoryEtc" title="기타분류" class="f_txt w_full" maxlength="20" />
                                                <form:errors path="categoryEtc" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="major">전공</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:textarea id="major" class="f_txtar w_full h_10" title="전공" path="major" cols="30" rows="2" />
                                                <br/><form:errors path="major" />
                                            </td>
                                            <td class="lb">
                                            	<label for="sex">성별</label>
                                            	<span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="sex">
                                                    <form:select path="sex" id="sex" name="sex" title="성별">
                                                    	<form:option value='' label="선택하세요" selected="selected" />
                                                        <form:option value='M'>남성</form:option>
                                                        <form:option value='F'>여성</form:option>
                                                    </form:select>
                                                    <br/><form:errors path="sex" />
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="introduce">자기소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <textarea title="자기소개 입력" id="introduce" class="f_txtar w_full h_300" name="introduce" cols="30" rows="10"></textarea>
                                                <form:errors path="introduce" />
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td class="lb">
                                                <label for="introduce">자기소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <textarea title="자기소개 입력" id="introduce" class="f_txtar w_full h_300" name="introduce" cols="30" rows="10" ><c:out value="${result.introduce}" escapeXml="true" /></textarea>
                                                <form:errors path="introduce" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="emplyrId">사용자아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_150">
                                                    <input type="text" maxlength="20" disabled="disabled" id="id_view" name="id_view" readonly="readonly">
                                                    <form:input path="emplyrId" id="emplyrId" title="사용자아이디" maxlength="20" type="hidden" />
                                                    <button type="button" class="btn" onclick="fnIdCheck();">조회</button>
                                                </span>
                                                <span class="f_txt_inner ml10">(중복체크)</span>
                                                <form:errors path="emplyrId" />
                                            </td>
                                            <td class="lb">
                                                <label for="moblphonNo">핸드폰번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="moblphonNo" id="moblphonNo" title="핸드폰번호" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="moblphonNo" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="password">비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:password path="password" id="password" title="비밀번호" class="f_txt w_full" maxlength="20" />
                                                <form:errors path="password" />
                                            </td>
                                            <td class="lb">
                                                <label for="password2">비밀번호확인</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="password2" id="password2" title="비밀번호확인" type="password" class="f_txt w_full" maxlength="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="passwordHint">비밀번호힌트</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_full" for="passwordHint">
                                                    <form:select path="passwordHint" id="passwordHint" name="passwordHint" title="비밀번호힌트">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="passwordHint" />
                                            </td>
                                            <td class="lb">
                                                <label for="passwordCnsr">비밀번호정답</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="passwordCnsr" id="passwordCnsr" title="비밀번호정답" class="f_txt w_full" maxlength="100" />
                                                <form:errors path="passwordCnsr" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="emplyrNm">이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="emplyrNm" id="emplyrNm" title="사용자이름" type="text" class="f_txt w_full" value="" maxlength="60" />
                                                <form:errors path="emplyrNm" />
                                            </td>
                                            <td class="lb">
                                                <label for="insttCode">소속기관</label>
                                            </td>
                                            <td>
                                                <label class="f_select w_full" for="insttCode">
                                                    <form:select path="insttCode" id="insttCode" name="insttCode" title="소속기관">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="insttCode" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="orgnztId">조직코드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_full" for="orgnztId">
                                                    <form:select path="orgnztId" id="orgnztId" name="orgnztId" title="부서">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="orgnztId" />
                                            </td>
                                            <td class="lb">
                                                <label for="ofcpsId">직급명</label>
                                            </td>
                                            <td>
                                                <form:input path="ofcpsId" id="ofcpsId" title="직급명" class="f_txt w_full" maxlength="30" />
                                                <form:errors path="ofcpsId" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="emailAdres">이메일주소</label>
                                            </td>
                                            <td>
                                                <form:input path="emailAdres" id="emailAdres" title="이메일주소" class="f_txt w_full" maxlength="50" />
                                                <form:errors path="emailAdres" />
                                            </td>
                                            <td class="lb">
                                                <label for="areaNo">집전화<br>지역번호</label>
                                            </td>
                                            <td>
                                                <form:input path="areaNo" id="areaNo" title="areaNo" class="f_txt w_70" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5" title="전화번호 첫번째">-</span>
                                                <form:input path="homemiddleTelno" title="homemiddleTelno" id="homemiddleTelno" class="f_txt w_70" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input path="homeendTelno" title="homeendTelno" id="homeendTelno" class="f_txt w_70" maxlength="5" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="offmTelno">사무실<br>전화번호</label>
                                            </td>
                                            <td>
                                                <form:input path="offmTelno" id="offmTelno" title="사무실전화번호" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="offmTelno" />
                                            </td>
                                            <td class="lb">
                                                <label for="fxnum">팩스번호</label>
                                            </td>
                                            <td>
                                                <form:input path="fxnum" id="fxnum" title="팩스번호" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="fxnum" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="homeadres">주소</label>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_150">
                                                    <form:input path="homeadres" id="zip_view" title="주소" maxlength="100" readonly="true" />
                                                    <form:errors path="homeadres" />
                                                    <form:hidden path="zip" />
                                                    <button type="button" class="btn" onclick="fn_egov_ZipSearch();">조회</button>
                                                </span>
                                                <span class="f_txt_inner ml15">(우편번호 검색)</span>
                                                <form:errors path="zip" />
                                                <input name="zip_view" id="zip_view" type="hidden" title="우편번호" value="<c:out value='${userManageVO.zip}'/>" maxlength="8" readonly="readonly" />
                                            </td>
                                            <td class="lb">
                                                <label for="detailAdres">상세주소</label>
                                            </td>
                                            <td>
                                                <form:input path="detailAdres" id="detailAdres" title="상세주소" class="f_txt w_full" maxlength="50" />
                                                <form:errors path="detailAdres" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="emplyrSttusCode">사용자상태<br>코드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_full" for="emplyrSttusCode">
                                                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" name="emplyrSttusCode" title="사용자상태코드">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="emplyrSttusCode" />
                                            </td>
                                            <td class="lb">
                                                <label for="groupId">그룹아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_full" for="groupId">
                                                    <form:select path="groupId" id="groupId" name="groupId" title="그룹아이디">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="groupId" />
                                            </td>
                                        </tr> --%>
                                        <%-- <tr>
                                            <td class="lb">
                                                <span class="min">답장가능여부</span>
                                            </td>
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${result.replyPosblAt == 'Y'}">
                                            			<spring:message code="button.possible" />
                                            		</c:when>
                                            		<c:otherwise>
                                            			<spring:message code="button.impossible" />
                                            		</c:otherwise>
                                            	</c:choose>
                                            </td>
                                            <td class="lb">
                                            	<label>파일첨부가능여부</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td class="rdoSet"><!-- 2개이상 radio 있을때 필요 -->
                                                <input type="radio" id="rdo3" name="fileAtchPosblAt" onclick="document.boardMaster.posblAtchFileNumber.disabled='';" value="Y" <c:if test="${result.fileAtchPosblAt == 'Y'}"> checked="checked"</c:if>>
                                                <spring:message code="button.possible" />
                                                <input type="radio" id="rdo4" class="ml20" name="fileAtchPosblAt" onclick="document.boardMaster.posblAtchFileNumber.disabled='disabled';" value="N" <c:if test="${result.fileAtchPosblAt == 'N'}"> checked="checked"</c:if>>
                                                <spring:message code="button.impossible" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="posblAtchFileNumber">첨부가능파일 숫자</label>
                                            </td>
                                            <td colspan="3">
                                                <label class="f_select" for="posblAtchFileNumber">
                                                    <select id="posblAtchFileNumber" name="posblAtchFileNumber" title="첨부가능파일 숫자선택" <c:if test="${result.fileAtchPosblAt == 'N'}"> disabled="disabled"</c:if>>
                                                        <option value="0" selected="selected">선택하세요</option>
                                                        <option value='1' <c:if test="${result.posblAtchFileNumber == '1'}">selected="selected"</c:if>>1개</option>
                                                        <option value='2' <c:if test="${result.posblAtchFileNumber == '2'}">selected="selected"</c:if>>2개</option>
                                                        <option value='3' <c:if test="${result.posblAtchFileNumber == '3'}">selected="selected"</c:if>>3개</option>
                                                    </select>
                                                    <br/><form:errors path="posblAtchFileNumber" />
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatNm">템플릿정보</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <span class="f_search2 w_350">
                                                    <input title="템플릿정보입력" id="tmplatNm" name="tmplatNm" type="text" value="<c:out value="${result.tmplatNm}"/>" maxlength="20" readonly="readonly" >
                                                    <input id="tmplatId" name="tmplatId" type="hidden" value='<c:out value="${result.tmplatId}"/>' >
                                                    <button type="button" class="btn" onclick="fn_egov_inqire_tmplatInqire(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                                    <br/><form:errors path="tmplatId" />
                                                </span>
                                            </td>
                                        </tr> --%>
                                        
                                        <%-- <c:if test="${addedOptions == 'true'}">
	                                        <tr>
	                                            <td class="lb">
	                                                <label for="">추가 선택사항</label>
	                                            </td>
	                                            <td colspan="3">
	                                                <label class="f_select" for="option">
                                                    <select id="option" name="option" title="추가선택사항선택" <c:if test="${result.option != 'na'}">disabled="disabled"</c:if>>
                                                        <option value='na' <c:if test="${result.option == 'na'}">selected="selected"</c:if>>선택하세요</option>
                                                        <option value='' <c:if test="${result.option == ''}">selected="selected"</c:if>>미선택</option>
                                                        <option value='comment' <c:if test="${result.option == 'comment'}">selected="selected"</c:if>>댓글</option>
                                                        <option value='stsfdg' <c:if test="${result.option == 'stsfdg'}">selected="selected"</c:if>>만족도조사</option>
                                                    </select>
                                                    	 ※ 추가 선택사항은 수정 불가 (미설정된 기존 게시판의 경우 처음 설정은 가능함)
                                                </label>
	                                            </td>
	                                        </tr>
                                        </c:if> --%>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_insert_teacherInf(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/portal/teacher/selectTeacherList.do'/>" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_select_teacherList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                </form:form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
		<c:import url="/sym/mms/EgovFooter.do" />
		<!--// Footer -->
    </div>
    
</body>
</html>