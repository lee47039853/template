package kr.or.ifac.modules.portal.survey.service;

import java.io.Serializable;

/**
 * 설문조사 정보를 담기 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class SurveyMaster implements Serializable {
    
    private int sq; // 만족도_시퀀스
    private String pageUrl; // 작성_페이지_URL
    private String menuSn; // 메뉴_일련번호
    private String responseCd; // 만족도_응답_코드
    private String responseCn; // 만족도_설문_내용
    private String registIp; // 등록자 IP
    private String registId; // 등록자_ID
    private String registNm; // 등록자_명
    private String registDe; // 등록_일자
    
    // Getter 및 Setter 메소드
    public int getSq() {
        return sq;
    }

    public void setSq(int sq) {
        this.sq = sq;
    }

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    public String getMenuSn() {
        return menuSn;
    }

    public void setMenuSn(String menuSn) {
        this.menuSn = menuSn;
    }

    public String getResponseCd() {
        return responseCd;
    }

    public void setResponseCd(String responseCd) {
        this.responseCd = responseCd;
    }

    public String getResponseCn() {
        return responseCn;
    }

    public void setResponseCn(String responseCn) {
        this.responseCn = responseCn;
    }

    public String getRegistIp() {
        return registIp;
    }

    public void setRegistIp(String registIp) {
        this.registIp = registIp;
    }

    public String getRegistId() {
        return registId;
    }

    public void setRegistId(String registId) {
        this.registId = registId;
    }

    public String getRegistNm() {
        return registNm;
    }

    public void setRegistNm(String registNm) {
        this.registNm = registNm;
    }

    public String getRegistDe() {
        return registDe;
    }

    public void setRegistDe(String registDe) {
        this.registDe = registDe;
    }
    
}