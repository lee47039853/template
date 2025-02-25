<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
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
    <script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/'/>js/ui.js"></script>
    <script src="<c:url value='/'/>js/jquery.js"></script>
    <script src="<c:url value='/'/>js/jqueryui.js"></script>
    <link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

    <title>내부업무 사이트 > 지원사업관리 > 지원사업 등록</title>
    <script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
    <validator:javascript formName="crawlingSupportMasterVO" staticJavascript="false" xhtml="true" cdata="false"/>
    <script type="text/javaScript" language="javascript" defer="defer">
    $(document).ready(function() {
        // CKEditor 자동 인라인 편집 비활성화
        // CKEDITOR.disableAutoInline = true;

        // CKEditor 4.16.2 보안 경고 메시지 화면에서 숨기기 (CSS 적용)
        $(\"<style>.cke_notification_warning { display: none !important; }</style>\").appendTo(\"head\");

        // CKEditor 4.16.2 보안 경고 메시지 콘솔에서 숨기기
        (function() {
            var originalWarn = console.warn;
            console.warn = function(message) {
                if (!message.includes(\"This CKEditor 4.16.2 version is not secure\")) {
                    originalWarn.apply(console, arguments);
                }
            };
        })();

        // CKEditor 적용
        // if (typeof CKEDITOR !== 'undefined') {
        //     if (CKEDITOR.instances['contents']) {
        //         CKEDITOR.instances['contents'].destroy();
        //     }
        //     CKEDITOR.replace('contents', {
        //         height: 400,
        //         language: 'ko' // 한국어 설정
        //     });
        //     console.log("CKEditor 로드 완료");
        // } else {
        //     console.error("CKEditor가 로드되지 않았습니다.");
        // }
    });

    function fnListPage(){
        document.crawlingSupportMasterVO.action = "<c:url value='/portal/support/SelectCrawlingSupportList.do'/>"; 
        document.crawlingSupportMasterVO.submit();
    }

    function fnInsert(){
        if(validateCrawlingSupportMasterVO(document.crawlingSupportMasterVO)){
            document.crawlingSupportMasterVO.submit();
        }
    }

    </script>

</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

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
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">지원사업관리</a></li>
                                        <li><a href="">지원사업 등록</a></li>
                                        <li>지원사업 등록</li>
                                    </ul>
                                </div>
                                <!--// Location -->

                                <form:form modelAttribute="crawlingSupportMasterVO" action="${pageContext.request.contextPath}/portal/support/SupportInsert.do" name="crawlingSupportMasterVO" method="post" >

                                <h1 class="tit_1">지원사업관리</h1>

                                <h2 class="tit_2">지원사업 등록</h2>

                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="source">사이트 유형(공통코드)</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="source" id="source" class="f_txt w_full" maxlength="15" />
                                                <form:errors path="source" />
                                                <form:hidden path="sq" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="contentsKey">컨텐츠 키값</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="contentsKey" id="contentsKey" class="f_txt w_full" maxlength="200" />
                                                <form:errors path="contentsKey" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="linkUrl">링크 url</label>
                                            </td>
                                            <td>
                                                <form:input path="linkUrl" id="linkUrl" class="f_txt w_full" maxlength="300" />
                                                <form:errors path="linkUrl" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="title">프로그램명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="title" id="title" class="f_txt w_full" maxlength="100" />
                                                <form:errors path="title" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="writer">대상</label>
                                            </td>
                                            <td>
                                                <form:input path="writer" id="writer" class="f_txt w_full" maxlength="100" />
                                                <form:errors path="writer" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="contents">소개</label>
                                            </td>
                                            <td>
                                                <form:textarea path="contents" id="contents" class="f_txtar w_full h_200" cols="30" rows="10"/>
                                                <form:errors path="contents" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="showYn">노출여부</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="showYn" id="showYn" class="f_txt w_full" maxlength="1" />
                                                <form:errors path="showYn" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="requestStDate">신청 시작 날짜</label>
                                            </td>
                                            <td>
                                                <form:input path="requestStDate" id="requestStDate" class="f_txt w_full" maxlength="20" />
                                                <form:errors path="requestStDate" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="requestStTime">신청 시작 시간</label>
                                            </td>
                                            <td>
                                                <form:input path="requestStTime" id="requestStTime" class="f_txt w_full" maxlength="5" />
                                                <form:errors path="requestStTime" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="requestEdDate">신청 종료 날짜</label>
                                            </td>
                                            <td>
                                                <form:input path="requestEdDate" id="requestEdDate" class="f_txt w_full" maxlength="20" />
                                                <form:errors path="requestEdDate" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="requestEdTime">신청 종료 시간</label>
                                            </td>
                                            <td>
                                                <form:input path="requestEdTime" id="requestEdTime" class="f_txt w_full" maxlength="5" />
                                                <form:errors path="requestEdTime" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="ref">조회수</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="ref" id="ref" class="f_txt w_full" maxlength="10" />
                                                <form:errors path="ref" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="supTypeList">지원 유형</label>
                                            </td>
                                            <td>
                                                <form:input path="supTypeList" id="supTypeList" class="f_txt w_full" maxlength="200" />
                                                <form:errors path="supTypeList" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="supTargetList">지원 대상</label>
                                            </td>
                                            <td>
                                                <form:input path="supTargetList" id="supTargetList" class="f_txt w_full" maxlength="200" />
                                                <form:errors path="supTargetList" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="supGenreList">지원 장르</label>
                                            </td>
                                            <td>
                                                <form:input path="supGenreList" id="supGenreList" class="f_txt w_full" maxlength="200" />
                                                <form:errors path="supGenreList" />
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td class="lb">
                                                <label for="supGunguList">지원 지역(군구)</label>
                                            </td>
                                            <td>
                                                <form:input path="supGunguList" id="supGunguList" class="f_txt w_full" maxlength="200" />
                                                <form:errors path="supGunguList" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.crawlingSupportMasterVO.reset();"><spring:message code="button.reset" /></a><!-- 초기화 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="JavaScript:fnInsert(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/portal/support/SelectCrawlingSupportList.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                <!-- 검색조건 유지 -->
                                <input type="hidden" name="searchCondition" value="<c:out value='${crawlingSupportMasterVO.searchCondition}'/>"/>
                                <input type="hidden" name="searchKeyword" value="<c:out value='${crawlingSupportMasterVO.searchKeyword}'/>"/>
                                <input type="hidden" name="pageIndex" value="<c:out value='${crawlingSupportMasterVO.pageIndex}'/><c:if test="${crawlingSupportMasterVO.pageIndex eq null}">1</c:if>"/>
                                
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