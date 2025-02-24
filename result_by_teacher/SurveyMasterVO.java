package kr.or.ifac.modules.portal.survey.service;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 설문조사 정보를 관리하기 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class SurveyMasterVO extends SurveyMaster implements Serializable {
    
    private String searchBgnDe = "";
    private String searchCnd = "";
    private String searchEndDe = "";
    private String searchWrd = "";
    private String sortOrdr = "";
    private String searchUseYn = "";
    private int pageIndex = 1;
    private int pageUnit = 10;
    private int pageSize = 10;
    private int firstIndex = 1;
    private int lastIndex = 1;
    private int recordCountPerPage = 10;
    private int rowNo = 0;
    private String frstRegisterNm = "";
    private String tmplatNm = "";
    private String lastUpdusrNm = "";
    private String authFlag = "";
    private String tmplatCours = "";

    // Getter 및 Setter 메소드
    public String getSearchBgnDe() {
        return searchBgnDe;
    }

    public void setSearchBgnDe(String searchBgnDe) {
        this.searchBgnDe = searchBgnDe;
    }

    public String getSearchCnd() {
        return searchCnd;
    }

    public void setSearchCnd(String searchCnd) {
        this.searchCnd = searchCnd;
    }

    public String getSearchEndDe() {
        return searchEndDe;
    }

    public void setSearchEndDe(String searchEndDe) {
        this.searchEndDe = searchEndDe;
    }

    public String getSearchWrd() {
        return searchWrd;
    }

    public void setSearchWrd(String searchWrd) {
        this.searchWrd = searchWrd;
    }

    public String getSortOrdr() {
        return sortOrdr;
    }

    public void setSortOrdr(String sortOrdr) {
        this.sortOrdr = sortOrdr;
    }

    public String getSearchUseYn() {
        return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
        this.searchUseYn = searchUseYn;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageUnit() {
        return pageUnit;
    }

    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getFirstIndex() {
        return firstIndex;
    }

    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    public int getLastIndex() {
        return lastIndex;
    }

    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }

    public int getRecordCountPerPage() {
        return recordCountPerPage;
    }

    public void setRecordCountPerPage(int recordCountPerPage) {
        this.recordCountPerPage = recordCountPerPage;
    }

    public int getRowNo() {
        return rowNo;
    }

    public void setRowNo(int rowNo) {
        this.rowNo = rowNo;
    }

    public String getFrstRegisterNm() {
        return frstRegisterNm;
    }

    public void setFrstRegisterNm(String frstRegisterNm) {
        this.frstRegisterNm = frstRegisterNm;
    }

    public String getTmplatNm() {
        return tmplatNm;
    }

    public void setTmplatNm(String tmplatNm) {
        this.tmplatNm = tmplatNm;
    }

    public String getLastUpdusrNm() {
        return lastUpdusrNm;
    }

    public void setLastUpdusrNm(String lastUpdusrNm) {
        this.lastUpdusrNm = lastUpdusrNm;
    }

    public String getAuthFlag() {
        return authFlag;
    }

    public void setAuthFlag(String authFlag) {
        this.authFlag = authFlag;
    }

    public String getTmplatCours() {
        return tmplatCours;
    }

    public void setTmplatCours(String tmplatCours) {
        this.tmplatCours = tmplatCours;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}