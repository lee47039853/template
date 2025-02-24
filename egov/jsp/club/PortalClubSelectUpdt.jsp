<%--
  Class Name : PortalClubSelectUpdt.jsp
  Description : 동아리 상세조회, 수정 JSP
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

<title>내부업무 사이트 > 시민문화관리 > 동아리 관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="clubMasterVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
        if (CKEDITOR.instances['longIntroduce']) {
            CKEDITOR.instances['longIntroduce'].destroy();
        }
        CKEDITOR.replace('longIntroduce', {
            height: 400,
            language: 'ko' // 한국어 설정
        });
        console.log("CKEditor 로드 완료");
    } else {
        console.error("CKEditor가 로드되지 않았습니다.");
    }
});


function fnListPage(){
    document.clubMasterVO.action = "<c:url value='/portal/club/SelectClubList.do'/>";
    document.clubMasterVO.submit();
}
function fnDeleteClub(sq) {
    if(confirm("<spring:message code="common.delete.msg" />")){
        document.clubMasterVO.checkedSqForDel.value=sq;
        document.clubMasterVO.action = "<c:url value='/portal/club/ClubDelete.do'/>";
        document.clubMasterVO.submit(); 
    }
}

function fnUpdate(){
    if(validateClubMasterVO(document.clubMasterVO)){
        document.clubMasterVO.submit();
    }
}

function fn_egov_dn_info_setting(dn) {
    var frm = document.clubMasterVO;
    frm.subDn.value = dn;
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
                                        <li><a href="/portal/club/SelectClubList.do">시민문화관리</a></li>
                                        <li><a href="/portal/club/SelectClubList.do">동아리 관리</a></li>
                                        <li>동아리 조회</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form:form modelAttribute="clubMasterVO" action="${pageContext.request.contextPath}/portal/club/ClubSelectUpdt.do" name="clubMasterVO" method="post" >
								
								<!-- 동아리 삭제시 prameter 전달용 input -->
								<input name="checkedSqForDel" type="hidden" />
								<!-- 검색조건 유지 -->
								<input type="hidden" name="searchCondition" value="<c:out value='${clubMasterVO.searchCondition}'/>"/>
								<input type="hidden" name="searchKeyword" value="<c:out value='${clubMasterVO.searchKeyword}'/>"/>
								<input type="hidden" name="sbscrbSttus" value="<c:out value='${clubMasterVO.sbscrbSttus}'/>"/>
								<input type="hidden" name="pageIndex" value="<c:out value='${clubMasterVO.pageIndex}'/>"/>

                                <h1 class="tit_1">시민문화관리</h1>

                                <h2 class="tit_2">동아리 상세조회(수정)</h2>

                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="clubName">동아리명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="clubName" id="clubName" class="f_txt w_full" maxlength="64" readonly="readonly"/>
                                                <form:errors path="clubName" />
                                                <form:hidden path="sq" />
                                            </td>
                                        </tr>
                                        
                                        <tr>    
                                            <td class="lb">
                                                <label for="activityAreaGungu">활동지역</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
												<c:forEach var="activityAreaGunguCode" items="${clubActivityAreaGunguCode_result}">
												    <%-- 기본적으로 체크되지 않은 상태의 체크박스를 생성 --%>
												    <form:checkbox path="activityAreaGungu" value="${activityAreaGunguCode.codeNm}" id="activityAreaGungu_${activityAreaGunguCode.code}" />
												    <label for="activityAreaGungu_${activityAreaGunguCode.code}">${activityAreaGunguCode.codeNm}</label>
												
												    <%-- clubMasterVO.activityAreaGungu 값을 쉼표로 분리하여 포함 여부 확인 후 체크 --%>
												    <c:forTokens var="activityAreaGungu" items="${clubMasterVO.activityAreaGungu}" delims=",">
												        <c:if test="${activityAreaGungu eq activityAreaGunguCode.codeNm}">
												            <script>
												                document.getElementById("activityAreaGungu_${activityAreaGunguCode.code}").checked = true;
												            </script>
												        </c:if>
												    </c:forTokens>
												</c:forEach>
                                                <form:errors path="activityAreaGungu" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="clubGenre">동아리 장르</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
												<c:forEach var="clubGenreCode" items="${clubGenreCode_result}">
												    <%-- 기본적으로 체크되지 않은 상태의 체크박스를 생성 --%>
												    <form:checkbox path="clubGenre" value="${clubGenreCode.code}" id="clubGenre_${clubGenreCode.code}" />
												    <label for="clubGenre_${clubGenreCode.code}">${clubGenreCode.codeNm}</label>
												
												    <%-- clubMasterVO.clubGenre 값을 쉼표로 분리하여 포함 여부 확인 후 체크 --%>
												    <c:forTokens var="clubGenre" items="${clubMasterVO.clubGenre}" delims=",">
												        <c:if test="${clubGenre eq clubGenreCode.code}">
												            <script>
												                document.getElementById("clubGenre_${clubGenreCode.code}").checked = true;
												            </script>
												        </c:if>
												    </c:forTokens>
												</c:forEach>
                                                <form:errors path="clubGenre" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="memberCount">활동 인원</label>
                                            </td>
                                            <td>
                                                <form:input path="memberCount" id="memberCount" class="f_txt w_70" maxlength="3" />
                                                <form:errors path="memberCount" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="shortIntroduce">동아리 한줄소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="shortIntroduce" id="shortIntroduce" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="shortIntroduce" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="detailIntro">동아리 소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:textarea path="detailIntro" id="detailIntro" class="f_txtar w_full h_200"  cols="30" rows="10"/>
                                                <form:errors path="detailIntro" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="longIntroduce">동아리 상세소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:textarea path="longIntroduce" id="longIntroduce" class="f_txtar w_full h_80"  cols="30" rows="10"/>
                                                <form:errors path="longIntroduce" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="mainImgOriginName">동아리 이미지 업로드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="mainImgOriginName" id="mainImgOriginName" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="mainImgOriginName" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="activityAreaSi">동아리 활동 이미지 업로드</label>
                                                
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="startDate">설립년도</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="startDate">
											        <form:select path="startDate" id="startDate" name="startDate" title="설립년도">
											            <form:option value="" label="선택하세요"/>
											            <form:options items="${years}" />
											        </form:select>
											    </label>
                                                <form:errors path="startDate" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="intermediary">매개자</label>
                                            </td>
                                            <td>
                                                <form:input path="intermediary" id="intermediary" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="intermediary" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="meetingPlace">모임장소</label>
                                            </td>
                                            <td>
                                                <form:input path="meetingPlace" id="meetingPlace" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="meetingPlace" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="communityUrl">커뮤니티 URL(또는 SNS)</label>
                                            </td>
                                            <td>
                                                <form:input path="communityUrl" id="communityUrl" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="communityUrl" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="tag">태그</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="tag" id="tag" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="tag" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="status">상태</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td class="rdoSet"><!-- 2개이상 radio 있을때 필요 -->
												<form:radiobutton path="status" id="Wait" value="Wait" />
												<label for="Wait">대기</label>
												<form:radiobutton path="status" id="Accept" value="Accept" />
												<label for="Accept">승인</label>
												<form:radiobutton path="status" id="Deny" value="Deny" />
												<label for="Deny">반려</label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:fnDeleteClub('<c:out value='${clubMasterVO.sq}'/>'); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="JavaScript:fnUpdate(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/portal/club/SelectClubList.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
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