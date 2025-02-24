<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

    <title>내부업무 사이트 > 시민문화 관리 > 동아리 관리 > 설문조사 관리</title>

    <script type="text/javascript" src="<c:url value="/js/EgovBBSMng.js" />" ></script>
    <script type="text/javascript" src="<c:url value="/validator.do"/>" ></script>
    <validator:javascript formName="surveyMaster" staticJavascript="false" xhtml="true" cdata="false"/>
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

        function fn_egov_validateForm(obj){
            return true;
        }
        
        function fn_egov_update_surveyMstr(){
        	
            if(confirm('<spring:message code="common.update.msg" />')){
                document.surveyMaster.action = "<c:url value='/portal/survey/UpdateSurvey.do'/>";
                document.surveyMaster.submit();                  
            }
        }   
        
        function fn_egov_select_surveyList(){
            document.surveyMaster.action = "<c:url value='/portal/survey/SelectSurveyList.do'/>";
            document.surveyMaster.submit();  
        }   
        
        function fn_egov_delete_surveyInf(){
            if(confirm('<spring:message code="common.delete.msg" />')){
                document.surveyMaster.action = "<c:url value='/portal/survey/DeleteSurvey.do'/>";
                document.surveyMaster.submit();  
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
                                        <li><a href="/portal/survey/SelectClubList.do">시민문화관리</a></li>
                                        <li><a href="/portal/survey/SelectClubList.do">동아리 관리</a></li>
                                        <li>설문조사 관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->

                                <form:form modelAttribute="surveyMaster" name="surveyMaster" action="<c:url value='/portal/survey/SelectSurvey.do'/>" method="post" >
                                <!-- 검색조건 유지 -->
                                <input type="hidden" name="searchCnd" value="<c:out value='${surveyMaster.searchCnd}'/>"/>
                                <input type="hidden" name="searchWrd" value="<c:out value='${surveyMaster.searchWrd}'/>"/>
                                <input type="hidden" name="pageIndex" value="<c:out value='${surveyMaster.pageIndex}'/>"/>
                                <input type="hidden" name="sq" value="<c:out value='${surveyMaster.sq}'/>" />

                                <h1 class="tit_1">시민문화관리</h1>

                                <h2 class="tit_2">설문조사 상세조회(수정)</h2>
                                
                                <div class="board_view2">
                                    <table summary="페이지 URL, 메뉴 일련번호, 응답 코드, 응답 내용, 등록자 IP, 등록자 ID, 등록자 명, 등록 일자 입니다.">
                                        <colgroup>
                                            <col style="width: 160px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="pageUrl">페이지 URL</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input title="페이지 URL 입력" id="pageUrl" class="f_txt w_full" path="pageUrl" maxlength="500" />
                                                <br/><form:errors path="pageUrl" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="menuSn">메뉴 일련번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input title="메뉴 일련번호 입력" id="menuSn" class="f_txt w_full" path="menuSn" maxlength="14" />
                                                <br/><form:errors path="menuSn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="responseCd">응답 코드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input title="응답 코드 입력" id="responseCd" class="f_txt w_full" path="responseCd" maxlength="10" />
                                                <br/><form:errors path="responseCd" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="responseCn">응답 내용</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <textarea title="응답 내용 입력" id="responseCn" class="f_txtar w_full h_300" path="responseCn" cols="30" rows="10"></textarea>
                                                <form:errors path="responseCn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="registIp">등록자 IP</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input title="등록자 IP 입력" id="registIp" class="f_txt w_full" path="registIp" maxlength="20" />
                                                <br/><form:errors path="registIp" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="registId">등록자 ID</label>
                                            </td>
                                            <td>
                                                <form:input title="등록자 ID 입력" id="registId" class="f_txt w_full" path="registId" maxlength="50" />
                                                <br/><form:errors path="registId" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="registNm">등록자 명</label>
                                            </td>
                                            <td>
                                                <form:input title="등록자 명 입력" id="registNm" class="f_txt w_full" path="registNm" maxlength="50" />
                                                <br/><form:errors path="registNm" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="fn_egov_delete_surveyInf(); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_update_surveyMstr(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/portal/survey/SelectSurveyList.do'/>" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_select_surveyList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
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