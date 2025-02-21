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
<validator:javascript formName="teacherMaster" staticJavascript="false" xhtml="true" cdata="false"/>
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
    
    function fn_egov_update_teacherMstr(){
		//일시적으로 주석처리
		/*
        if (!validateTeacherMaster(document.teacherMaster)){
            return;
        }
		*/
        
        if(confirm('<spring:message code="common.update.msg" />')){
            document.teacherMaster.action = "<c:url value='/portal/teacher/UpdateTeacherInf.do'/>";
            document.teacherMaster.submit();                  
        }
    }   
    
    function fn_egov_select_teacherList(){
        document.teacherMaster.action = "<c:url value='/portal/teacher/SelectTeacherList.do'/>";
        document.teacherMaster.submit();  
    }   
    
    function fn_egov_delete_teacherInf(){
        if(confirm('<spring:message code="common.delete.msg" />')){
            document.teacherMaster.action = "<c:url value='/portal/teacher/DeleteTeacherInf.do'/>";
            document.teacherMaster.submit();  
        }       
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

								<form:form modelAttribute="teacherMaster" name="teacherMaster" action="<c:url value='/portal/teacher/SelectTeacherInf.do'/>" method="post" >
								<!-- 검색조건 유지 -->
								<input type="hidden" name="searchCnd" value="<c:out value='${teacherMaster.searchCnd}'/>"/>
								<input type="hidden" name="searchWrd" 	value="<c:out value='${teacherMaster.searchWrd}'/>"/>
								<input type="hidden" name="pageIndex" 		value="<c:out value='${teacherMaster.pageIndex}'/>"/>
								<input type="hidden" name="sq" 				value="<c:out value='${teacherMaster.sq}'/>" />

                                <h1 class="tit_1">시민문화관리</h1>

                                <h2 class="tit_2">강사 상세조회(수정)</h2>
                                
                                <div class="board_view2">
                                    <table summary="강사이름,분야,전공,성별, ..입니다">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="encTeacherName">강사 이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input title="이름입력" id="encTeacherName" class="f_txt w_full" path="encTeacherName" maxlength="300" />
                                                <br/><form:errors path="encTeacherName" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">분야 대분류</span>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                            	<c:forEach var="teacher" items="${teacherCode_result}">
												    <c:if test="${teacher.code eq teacherMaster.category1}">
												        ${teacher.codeNm}
												    </c:if>
												</c:forEach>
												<%-- <input type="hidden" name="category1" value="<c:out value='${teacherMaster.category1}'/>" /> --%>
												<form:hidden path="category1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">분야 소분류</span>
                                            </td>
                                            <td>
                                            	<c:forEach var="teacher" items="${teacherCode_result}">
												    <c:if test="${teacher.code eq teacherMaster.category2}">
												        ${teacher.codeNm}
												    </c:if>
												</c:forEach>
												<%-- <input type="hidden" name="category2" value="<c:out value='${teacherMaster.category2}'/>" /> --%>
												<form:hidden path="category2" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">대분류(서브)</span>
                                            </td>
                                            <td>
                                            	<c:forEach var="teacher" items="${teacherCode_result}">
												    <c:if test="${teacher.code eq teacherMaster.category3}">
												        ${teacher.codeNm}
												    </c:if>
												</c:forEach>
												<%-- <input type="hidden" name="category3" value="<c:out value='${teacherMaster.category3}'/>" /> --%>
												<form:hidden path="category3" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">기타 분류</span>
                                            </td>
                                            <td>
                                            	<form:input title="기타 분류" id="categoryEtc" class="f_txt w_full" path="categoryEtc" maxlength="20" />
                                                <br/><form:errors path="categoryEtc" />
                                            </td>
                                        </tr>                                        
                                        <tr>
                                        	<td class="lb">
                                            	<label for="sex">생년월일</label>
                                            </td>
                                            <td>
                                            	<form:input title="생년월일" id="birth" class="f_txt w_full" path="birth" maxlength="20" />
                                                <br/><form:errors path="birth" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="sex">성별</label>
                                            </td>
                                            <td>
                                                <label class="f_select" for="sex">
                                                    <form:select path="sex" name="sex" title="성별">
                                                        <option value='M' <c:if test="${teacherMaster.sex == 'M'}">selected="selected"</c:if>>남성</option>
                                                        <option value='F' <c:if test="${teacherMaster.sex == 'F'}">selected="selected"</c:if>>여성</option>
                                                    </form:select>
                                                    <br/><form:errors path="sex" />
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                            	<label for="encEmail">이메일</label>
                                            	<span class="req">필수</span>
                                            </td>
                                            <td>
                                            	<form:input title="이메일" id="encEmail" class="f_txt w_half" path="encEmail" maxlength="300" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;<form:checkbox path="emailChk" value="Y" id="emailChk" />
												<label for="emailChk">정보공개여부</label>
												<br/><form:errors path="encEmail" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                            	<label for="encPhone">휴대전화</label>
                                            </td>
                                            <td>
                                            	<form:input title="휴대전화" id="encPhone" class="f_txt w_half" path="encPhone" maxlength="300" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;<form:checkbox path="phoneChk" value="Y" id="phoneChk" />
												<label for="phoneChk">정보공개여부</label>
                                                <br/><form:errors path="encPhone" />
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                        	<td class="lb">
                                            	<label for="encTelno">일반전화</label>
                                            </td>
                                            <td>
                                            	<form:input title="일반전화" id="encTelno" class="f_txt w_full" path="encTelno" maxlength="300" />
                                                <br/><form:errors path="encTelno" />
                                            </td>
                                        </tr> --%>
                                        <tr>
                                        	<td class="lb">
                                            	<label for="encAddressDetail">주소지</label>
                                            </td>
                                            <td>
                                                <label class="f_select" for="gungu">
                                                    <form:select path="gungu" id="gungu" name="gungu" title="주소지선택">
                                                        <form:option value='' label="선택하세요" selected="selected" />
                                                        <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="gungu" />
                                                <form:input title="상세주소지" id="encAddressDetail" class="f_txt w_1200" path="encAddressDetail" maxlength="500" />
                                                <br/><form:errors path="encAddressDetail" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="introduce">자기소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:textarea path="introduce" id="introduce" class="f_txtar w_full h_300" cols="30" rows="10" title="자기소개 입력" />
                                                <form:errors path="introduce" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="major">전공</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input title="전공 입력" id="major" class="f_txt w_full" path="major" />
                                                <form:errors path="major" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="profileOriginName">프로필</label>
                                            </td>
                                            <td>
                                                <form:input title="프로필 입력" id="profileOriginName" class="f_txt w_half" path="profileOriginName" />
                                                <form:errors path="profileOriginName" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;<form:checkbox path="profileChk" value="Y" id="profileChk" />
												<label for="profileChk">정보공개여부</label>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td class="lb">
                                                <label for="encSns">SNS정보</label>
                                            </td>
                                            <td>
                                                <input title="SNS 입력" id="encSns" class="f_txtar w_full" name="encSns" type="text" value='<c:out value="${teacherMaster.encSns}"/>' >
                                                <form:errors path="encSns" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="encSns">경력정보</label>
                                            </td>
                                            <td>
                                                <input title="SNS 입력" id="encSns" class="f_txtar w_full" name="encSns" type="text" value='<c:out value="${teacherMaster.encSns}"/>' >
                                                <form:errors path="encSns" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="encSns">자격증정보</label>
                                            </td>
                                            <td>
                                                <input title="SNS 입력" id="encSns" class="f_txtar w_full" name="encSns" type="text" value='<c:out value="${teacherMaster.encSns}"/>' >
                                                <form:errors path="encSns" />
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td class="lb">
                                                <label for="status">상태</label>
                                            </td>
                                            <td>
                                                <label class="f_select" for="status">
                                                    <form:select id="status" path="status" title="성별">
                                                        <option value='WAIT' <c:if test="${teacherMaster.status == 'WAIT'}">selected="selected"</c:if>>신청</option>
                                                        <option value='ACCEPT' <c:if test="${teacherMaster.status == 'ACCEPT'}">selected="selected"</c:if>>승인</option>
                                                        <option value='DENY' <c:if test="${teacherMaster.status == 'DENY'}">selected="selected"</c:if>>거절</option>
                                                    </form:select>
                                                    <br/><form:errors path="status" />
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    	<a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="fn_egov_delete_teacherInf(); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_update_teacherMstr(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
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