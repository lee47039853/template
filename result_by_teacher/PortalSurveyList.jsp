<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

    <title>내부업무 사이트 > 시민문화관리 > 동아리 관리 > 설문조사 관리</title>

    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
    <script type="text/javascript">
        function press(event) {
            if (event.keyCode==13) {
                fn_egov_select_survey('1');
            }
        }
        
        function fn_egov_insert_addSurvey(){   
            document.frm.action = "<c:url value='/portal/survey/AddSurvey.do'/>";
            document.frm.submit();
        }
        
        function fn_egov_select_survey(pageNo){
            document.frm.pageIndex.value = pageNo; 
            document.frm.action = "<c:url value='/portal/survey/SelectSurveyList.do'/>";
            document.frm.submit();  
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

                                <h1 class="tit_1">시민문화관리</h1>

                                <h2 class="tit_2">설문조사 관리</h2>
                                <form name="frm" action="<c:url value='/portal/survey/SelectSurveyList.do'/>" method="post">
                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                
                                    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                
                                    <label class="item f_select" for="searchCnd">
                                        <select id="searchCnd" name="searchCnd" title="검색유형선택">
                                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >전체검색</option>
                                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >페이지 URL</option>
                                         </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_500" title="검색값입력" id="searchWrd" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}" />' maxlength="100" onkeypress="press(event);">
                                        <button class="btn" type="submit" onclick="fn_egov_select_survey('1'); return false;"><spring:message code="button.inquire"/></button><!-- 조회 -->
                                    </span>
                                    
                                </div>
                                <!--// 검색조건 -->
                                
                                <div class="board_list_top">
                                    <div class="left_col">
                                            <div class="list_count">
                                                 <span>사용자수</span>
                                                 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>
                                            </div>
                                        </div>
                                        <div class="right_col">
                                             <a href="<c:url value='/portal/survey/AddSurvey.do'/>" class="item btn btn_blue_46 w_100" onclick="fn_egov_insert_addSurvey(); return false;"><spring:message code="button.add"/></a><!-- 추가 -->
                                         </div>
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="번호,게시판명,게시판유형,게시판속성,생성일,사용여부  목록입니다">
                                        <caption>사용자목록관리</caption>
                                        <colgroup>
                                            <col style="width: 100px;">
                                            <col style="width: 250px;">
                                            <col style="width: 250px;">
                                            <col style="width: 250px;">
                                            <col style="width: 250px;">
                                            <col style="width: 100px;">
                                            <col style="width: 200px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">순번</th>
                                                <th scope="col">페이지 URL</th>
                                                <th scope="col">메뉴 일련번호</th>
                                                <th scope="col">응답 코드</th>
                                                <th scope="col">응답 내용</th>
                                                <th scope="col">등록자 IP</th>
                                                <th scope="col">등록 일자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <c:if test="${fn:length(resultList) == 0}">
                                                <tr>
                                                    <td colspan="8"><spring:message code="common.nodata.msg" /></td>
                                                </tr>
                                            </c:if>
                                            
                                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                                <tr>
                                                    <td>
                                                        <c:out value="${result.sq}"/>
                                                    </td>
                                                    <td>
                                                        <a href="<c:url value='/portal/survey/SelectSurvey.do'/>?sq=<c:out value='${result.sq}'/>" class="lnk">
                                                            <c:out value="${result.pageUrl}"/>
                                                        </a>
                                                    </td>
                                                    <td><c:out value="${result.menuSn}"/></td>
                                                    <td><c:out value="${result.responseCd}"/></td>
                                                    <td><c:out value="${result.responseCn}"/></td>
                                                    <td><c:out value="${result.registIp}"/></td>
                                                    <td><c:out value='${fn:substring(result.registDe, 0,10)}'/></td>
                                                </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>

                                <!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_survey" />
                                        </ul>
                                    </div>
                                </div>
                                <!-- // 페이지 네비게이션 끝 --> 
                                <!--// 설문조사관리 -->
                                </form>
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