<%--
  Class Name : PortalSurveySelectUpdt.jsp
  Description : 설문조사 상세조회, 수정 JSP
  Modification Information
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<!-- CSS -->
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css"> 
	<!-- jQuery -->
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<title>내부업무 사이트 > 설문조사관리 > 설문조사 관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="surveyMasterVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
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
        if (CKEDITOR.instances['responseCn']) {
            CKEDITOR.instances['responseCn'].destroy();
        }
        CKEDITOR.replace('responseCn', {
            height: 400,
            language: 'ko' // 한국어 설정
        });
        console.log("CKEditor 로드 완료");
    } else {
        console.error("CKEditor가 로드되지 않았습니다.");
    }
});


function fnListPage(){
    document.surveyMasterVO.action = "<c:url value='/portal/survey/SelectSurveyList.do'/>";
    document.surveyMasterVO.submit();
}
function fnDeleteSurvey(sq) {
    if(confirm("<spring:message code="common.delete.msg" />")){
        document.surveyMasterVO.checkedSqForDel.value=sq;
        document.surveyMasterVO.action = "<c:url value='/portal/survey/SurveyDelete.do'/>";
        document.surveyMasterVO.submit(); 
    }
}

function fnUpdate(){
    if(validateSurveyMasterVO(document.surveyMasterVO)){
        document.surveyMasterVO.submit();
    }
}

</script>

</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<body>

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
                                        <li><a href="/portal/survey/SelectSurveyList.do">설문조사관리</a></li>
                                        <li><a href="/portal/survey/SelectSurveyList.do">설문조사 관리</a></li>
                                        <li>설문조사 조회</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form:form modelAttribute="surveyMasterVO" action="${pageContext.request.contextPath}/portal/survey/SurveySelectUpdt.do" name="surveyMasterVO" method="post" >
								
								<!-- 설문조사 삭제시 prameter 전달용 input -->
								<input name="checkedSqForDel" type="hidden" />
								<!-- 검색조건 유지 -->
								<input type="hidden" name="searchCondition" value="<c:out value='${surveyMasterVO.searchCondition}'/>"/>
								<input type="hidden" name="searchKeyword" value="<c:out value='${surveyMasterVO.searchKeyword}'/>"/>
								<input type="hidden" name="responseCd" value="<c:out value='${surveyMasterVO.responseCd}'/>"/>
								<input type="hidden" name="pageIndex" value="<c:out value='${surveyMasterVO.pageIndex}'/>"/>

                                <h1 class="tit_1">설문조사관리</h1>

                                <h2 class="tit_2">설문조사 상세조회(수정)</h2>

                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="pageUrl">페이지 URL</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="pageUrl" id="pageUrl" class="f_txt w_full" maxlength="500" readonly="readonly"/>
                                                <form:errors path="pageUrl" />
                                                <form:hidden path="sq" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="menuSn">메뉴 일련번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="menuSn" id="menuSn" class="f_txt w_full" maxlength="14" />
                                                <form:errors path="menuSn" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="responseCd">응답 코드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="responseCd" id="responseCd" class="f_txt w_full" maxlength="10" />
                                                <form:errors path="responseCd" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="responseCn">설문 내용</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:textarea path="responseCn" id="responseCn" class="f_txtar w_full h_200"  cols="30" rows="10"/>
                                                <form:errors path="responseCn" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="registIp">등록자 IP</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="registIp" id="registIp" class="f_txt w_full" maxlength="20" />
                                                <form:errors path="registIp" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="registId">등록자 ID</label>
                                            </td>
                                            <td>
                                                <form:input path="registId" id="registId" class="f_txt w_full" maxlength="50" />
                                                <form:errors path="registId" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="registNm">등록자 명</label>
                                            </td>
                                            <td>
                                                <form:input path="registNm" id="registNm" class="f_txt w_full" maxlength="50" />
                                                <form:errors path="registNm" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:fnDeleteSurvey('<c:out value='${surveyMasterVO.sq}'/>'); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="JavaScript:fnUpdate(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/portal/survey/SelectSurveyList.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
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