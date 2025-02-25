package kr.or.ifac.modules.portal.support.service;

import java.io.Serializable;

/**
 * 지원사업 정보를 담기 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class CrawlingSupportMaster implements Serializable {
    /** 연번 */
    private int sq;

    /** 사이트 유형(공통코드) */
    private String source;

    /** 컨텐츠 키값 */
    private String contentsKey;

    /** 링크 url */
    private String linkUrl;

    /** 프로그램명 */
    private String title;

    /** 대상 */
    private String writer;

    /** 소개 */
    private String contents;

    /** 노출여부 */
    private String showYn;

    /** 등록날짜 */
    private String regDate;

    /** 신청 시작 날짜 */
    private String requestStDate;

    /** 신청 시작 시간 */
    private String requestStTime;

    /** 신청 종료 날짜 */
    private String requestEdDate;

    /** 신청 종료 시간 */
    private String requestEdTime;

    /** 조회수 */
    private int ref;

    /** 지원 유형 */
    private String supTypeList;

    /** 지원 대상 */
    private String supTargetList;

    /** 지원 장르 */
    private String supGenreList;

    /** 지원 지역(군구) */
    private String supGunguList;

    /** 파일수 */
    private int filesu;

    // 기본 생성자
    public CrawlingSupportMaster() {}

    // 모든 필드를 포함하는 생성자
    public CrawlingSupportMaster(int sq, String source, String contentsKey, String linkUrl, String title, String writer, String contents,
                                 String showYn, String regDate, String requestStDate, String requestStTime, String requestEdDate,
                                 String requestEdTime, int ref, String supTypeList, String supTargetList, String supGenreList,
                                 String supGunguList, int filesu) {
        this.sq = sq;
        this.source = source;
        this.contentsKey = contentsKey;
        this.linkUrl = linkUrl;
        this.title = title;
        this.writer = writer;
        this.contents = contents;
        this.showYn = showYn;
        this.regDate = regDate;
        this.requestStDate = requestStDate;
        this.requestStTime = requestStTime;
        this.requestEdDate = requestEdDate;
        this.requestEdTime = requestEdTime;
        this.ref = ref;
        this.supTypeList = supTypeList;
        this.supTargetList = supTargetList;
        this.supGenreList = supGenreList;
        this.supGunguList = supGunguList;
        this.filesu = filesu;
    }

    // Getters and Setters
    public int getSq() { return sq; }
    public void setSq(int sq) { this.sq = sq; }

    public String getSource() { return source; }
    public void setSource(String source) { this.source = source; }

    public String getContentsKey() { return contentsKey; }
    public void setContentsKey(String contentsKey) { this.contentsKey = contentsKey; }

    public String getLinkUrl() { return linkUrl; }
    public void setLinkUrl(String linkUrl) { this.linkUrl = linkUrl; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getWriter() { return writer; }
    public void setWriter(String writer) { this.writer = writer; }

    public String getContents() { return contents; }
    public void setContents(String contents) { this.contents = contents; }

    public String getShowYn() { return showYn; }
    public void setShowYn(String showYn) { this.showYn = showYn; }

    public String getRegDate() { return regDate; }
    public void setRegDate(String regDate) { this.regDate = regDate; }

    public String getRequestStDate() { return requestStDate; }
    public void setRequestStDate(String requestStDate) { this.requestStDate = requestStDate; }

    public String getRequestStTime() { return requestStTime; }
    public void setRequestStTime(String requestStTime) { this.requestStTime = requestStTime; }

    public String getRequestEdDate() { return requestEdDate; }
    public void setRequestEdDate(String requestEdDate) { this.requestEdDate = requestEdDate; }

    public String getRequestEdTime() { return requestEdTime; }
    public void setRequestEdTime(String requestEdTime) { this.requestEdTime = requestEdTime; }

    public int getRef() { return ref; }
    public void setRef(int ref) { this.ref = ref; }

    public String getSupTypeList() { return supTypeList; }
    public void setSupTypeList(String supTypeList) { this.supTypeList = supTypeList; }

    public String getSupTargetList() { return supTargetList; }
    public void setSupTargetList(String supTargetList) { this.supTargetList = supTargetList; }

    public String getSupGenreList() { return supGenreList; }
    public void setSupGenreList(String supGenreList) { this.supGenreList = supGenreList; }

    public String getSupGunguList() { return supGunguList; }
    public void setSupGunguList(String supGunguList) { this.supGunguList = supGunguList; }

    public int getFilesu() { return filesu; }
    public void setFilesu(int filesu) { this.filesu = filesu; }
}