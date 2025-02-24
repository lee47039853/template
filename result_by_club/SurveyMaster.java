package kr.or.ifac.modules.portal.survey.service;

import java.io.Serializable;

/**
 * 만족도 설문조사 정보를 담기 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class SurveyMaster implements Serializable {
    /** 연번 */
    private int sq;

    /** 작성 페이지 URL */
    private String pageUrl;

    /** 메뉴 일련번호 */
    private String menuSn;

    /** 만족도 응답 코드 */
    private String responseCd;

    /** 만족도 설문 내용 */
    private String responseCn;

    /** 등록자 IP */
    private String registIp;

    /** 등록자 ID */
    private String registId;

    /** 등록자 명 */
    private String registNm;

    /** 등록 일자 */
    private String registDe;

    // 기본 생성자
    public SurveyMaster() {}

    // 모든 필드를 포함하는 생성자
    public SurveyMaster(int sq, String pageUrl, String menuSn, String responseCd, String responseCn,
                        String registIp, String registId, String registNm, String registDe) {
        this.sq = sq;
        this.pageUrl = pageUrl;
        this.menuSn = menuSn;
        this.responseCd = responseCd;
        this.responseCn = responseCn;
        this.registIp = registIp;
        this.registId = registId;
        this.registNm = registNm;
        this.registDe = registDe;
    }

    // Getters and Setters
    public int getSq() { return sq; }
    public void setSq(int sq) { this.sq = sq; }

    public String getPageUrl() { return pageUrl; }
    public void setPageUrl(String pageUrl) { this.pageUrl = pageUrl; }

    public String getMenuSn() { return menuSn; }
    public void setMenuSn(String menuSn) { this.menuSn = menuSn; }

    public String getResponseCd() { return responseCd; }
    public void setResponseCd(String responseCd) { this.responseCd = responseCd; }

    public String getResponseCn() { return responseCn; }
    public void setResponseCn(String responseCn) { this.responseCn = responseCn; }

    public String getRegistIp() { return registIp; }
    public void setRegistIp(String registIp) { this.registIp = registIp; }

    public String getRegistId() { return registId; }
    public void setRegistId(String registId) { this.registId = registId; }

    public String getRegistNm() { return registNm; }
    public void setRegistNm(String registNm) { this.registNm = registNm; }

    public String getRegistDe() { return registDe; }
    public void setRegistDe(String registDe) { this.registDe = registDe; }
}