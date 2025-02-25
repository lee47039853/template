<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
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

    <title>내부업무 사이트 > 지원사업관리 > 지원사업 관리</title>

    <script type="text/javascript">
        function fnCheckAll() {
            var checkField = document.listForm.checkField;
            if(document.listForm.checkAll.checked) {
                if(checkField) {
                    if(checkField.length > 1) {
                        for(var i=0; i < checkField.length; i++) {
                            checkField[i].checked = true;
                        }
                    } else {
                        checkField.checked = true;
                    }
                }
            } else {
                if(checkField) {
                    if(checkField.length > 1) {
                        for(var j=0; j < checkField.length; j++) {
                            checkField[j].checked = false;
                        }
                    } else {
                        checkField.checked = false;
                    }
                }
            }
        }
        
        function fnDeleteSupport() {
            var checkField = document.listForm.checkField;
            var sq = document.listForm.checkSq;
            var checkedSqs = "";
            var checkedCount = 0;
            if(checkField) {
                if(checkField.length > 1) {
                    for(var i=0; i < checkField.length; i++) {
                        if(checkField[i].checked) {
                            checkedSqs += ((checkedCount==0? "" : ",") + sq[i].value);
                            checkedCount++;
                        }
                    }
                } else {
                    if(checkField.checked) {
                        checkedSqs = sq.value;
                    }
                }
            }
            if(checkedSqs.length > 0) {
                if(confirm("<spring:message code='common.delete.msg' />")){
                    document.listForm.checkedSqForDel.value=checkedSqs;    
                    document.listForm.action = "<c:url value='/portal/support/SupportDelete.do'/>";
                    document.listForm.submit();
                }
            }
        }
        
        function fnAddSupportView() {
            document.listForm.action = "<c:url value='/portal/support/SupportInsertView.do'/>";
            document.listForm.submit();
        }

        function press(event) {
            if (event.keyCode==13) {
                fnSearch();
            }
        }
        
        function fnSelectSupport(sq) {
            document.listForm.selectedSq.value = sq;
            document.listForm.action = "<c:url value='/portal/support/SupportSelectUpdtView.do'/>";
            document.listForm.submit();
        }
        
        function fnLinkPage(pageNo){
            document.listForm.pageIndex.value = pageNo;
            document.listForm.action = "<c:url value='/portal/support/SelectCrawlingSupportList.do'/>";
            document.listForm.submit();
        }
        
        function fnSearch(){
            document.listForm.pageIndex.value = 1;
            document.listForm.action = "<c:url value='/portal/support/SelectCrawlingSupportList.do'/>";
            document.listForm.submit();
        }
        
        <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>
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
                                        <li><a href="/portal/support/SelectCrawlingSupportList.do">지원사업관리</a></li>
                                        <li><a href="/portal/support/SelectCrawlingSupportList.do">지원사업 관리</a></li>
                                        <li>지원사업 조회</li>
                                    </ul>
                                </div>
                                <!--// Location -->

                                <h1 class="tit_1">지원사업관리</h1>

                                <h2 class="tit_2">지원사업 조회</h2>
                                
                                <form name="listForm" action="<c:url value='/portal/support/SelectCrawlingSupportList.do'/>" method="post">
                                <input name="selectedSq" type="hidden" />
                                <input name="checkedSqForDel" type="hidden" />
                                <input name="pageIndex" type="hidden" value="<c:out value='${crawlingSupportMasterVO.pageIndex}'/>"/>
                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                    <label class="item f_select" for="searchCondition">
                                        <select name="searchCondition" id="searchCondition" title="검색조건">
                                            <option value="0" <c:if test="${empty crawlingSupportMasterVO.searchCondition || crawlingSupportMasterVO.searchCondition == '0'}">selected="selected"</c:if> >프로그램명</option>
                                            <option value="1" <c:if test="${crawlingSupportMasterVO.searchCondition == '1'}">selected="selected"</c:if> >대상</option>
                                            <option value="2" <c:if test="${crawlingSupportMasterVO.searchCondition == '2'}">selected="selected"</c:if> >노출여부</option>
                                        </select>
                                    </label>
                                    
                                    <span class="item f_search">
                                        <input class="f_input w_350" name="searchKeyword" title="검색어" type="text" value="<c:out value='${crawlingSupportMasterVO.searchKeyword}'/>" />
                                        <button class="btn" type="submit" onclick="javascript:fnSearch(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span>
                                </div>
                                <!--// 검색조건 -->
                                
                                <div class="board_list_top">
                                    <div class="left_col">
                                    	<div class="list_count">
                                     		<span>지원사업수</span>
                                     		<strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>
                                     	</div>
                                    </div>
                                    <div class="right_col">
                                    	<a href="#LINK" class="item btn btn_blue_46 w_100" onclick="javascript:fnDeleteSupport(); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
                                    	<a href="<c:url value='/portal/support/SupportInsertView.do'/>" class="item btn btn_blue_46 w_100" onclick="fnAddSupportView(); return false;"><spring:message code="button.create" /></a><!-- 추가 -->
                                    </div>
                                </div>

                                <!-- 지원사업 -->
                                <div class="board_list">
                                    <table summary="지원사업 목록입니다">
                                    	<caption>지원사업목록관리</caption>
                                        <colgroup>
                                            <col style="width: 50px;">
                                            <col style="width: 50px;">
                                            <col style="width: 100px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 300px;">
                                            <col style="width: 100px;">
                                            <col style="width: 200px;">
                                            <col style="width: 50px;">
                                            <col style="width: 150px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">
                                                    <span class="f_chk_only chkAll">
                                                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fnCheckAll();"/>
                                                    </span>
                                                </th>
                                                <th scope="col">사이트 유형(공통코드)</th>
                                                <th scope="col">프로그램명</th>
                                                <th scope="col">컨텐츠 키값</th>
                                                <th scope="col">링크 url</th>
                                                <th scope="col">대상</th>
                                                <th scope="col">소개</th>
                                                <th scope="col">노출여부</th>
                                                <th scope="col">등록날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        		<tr>
                                        			<td colspan="10"><spring:message code="common.nodata.msg" /></td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="result" items="${resultList}" varStatus="status">
	                                            <tr>
	                                                <td><c:out value="${paginationInfo.totalRecordCount - ((crawlingSupportMasterVO.pageIndex-1) * crawlingSupportMasterVO.pageSize) - status.index}"/></td>
	                                                <td>
	                                                    <span class="f_chk_only">
	                                                        <input name="checkField" title="Check <c:out value="${status.count}"/>"  type="checkbox"/>
	                                                        <input name="checkSq" type="hidden" value="<c:out value='${result.sq}'/>"/>
	                                                    </span>
	                                                </td>
	                                                <td>
	                                                	<a href="<c:url value='/portal/support/SupportSelectUpdtView.do'/>?selectedSq=<c:out value='${result.sq}'/>" class="lnk">
	                                               		<c:out value="${result.source}"/>
	                                               	</a>
	                                                </td>
	                                                <td><c:out value="${result.title}"/></td>
	                                                <td><c:out value="${result.contentsKey}"/></td>
	                                                <td><c:out value="${result.linkUrl}"/></td>
	                                                <td><c:out value="${result.writer}"/></td>
	                                                <td>
														<c:choose>
														    <c:when test="${fn:length(result.contents) > 20}">
														        <c:out value="${fn:substring(result.contents, 0, 20)}"/>...
														    </c:when>
														    <c:otherwise>
														        <c:out value="${result.contents}"/>
														    </c:otherwise>
														</c:choose>
	                                                </td>
	                                                <td><c:out value="${result.showYn}"/></td>
	                                                <td><c:out value="${result.regDate}"/></td>
	                                            </tr>
                                            </c:forEach>
                                             
                                        </tbody>
                                    </table>
                                </div>
                                
								<!-- 페이지 네비게이션 시작 -->
								<c:if test="${!empty crawlingSupportMasterVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fnLinkPage" />
                                        </ul>
                                    </div>
                                </div>
                                </c:if>
                                <!-- //페이지 네비게이션 끝 -->
                                <!--// 지원사업관리 -->
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