package kr.or.ifac.modules.portal.teacher.service;

import java.io.Serializable;

/**
 * 강사 속성 정보를 담기 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class TeacherMaster implements Serializable {
	
	private int sq; // 고유 식별자
    private String encTeacherName; // 암호화된 강사 이름
    private String category1; // 분야 대분류
    private String category2; // 분야 소분류
    private String category3; // 대분류 서브 카테고리
    private String categoryEtc; // 기타 분류 정보
    private String major; // 전공
    private String birth; // 생년월일
    private String sex; // 성별
    private String encEmail; // 암호화된 이메일 주소
    private String encPhone; // 암호화된 휴대전화 번호
    private String encTelno; // 암호화된 일반 전화 번호
    private String gungu; // 구/군 정보
    private String encAddressDetail; // 암호화된 상세 주소
    private String encSns; // 암호화된 SNS 주소
    private String introduce; // 자기소개
    private String profileOriginName; // 프로필 이미지 원본 파일명
    private String profileSaveName; // 프로필 이미지 저장 파일명
    private String profileThumbName; // 프로필 이미지 썸네일 파일명
    private String phoneChk; // 휴대전화 정보 제공 동의 여부
    private String emailChk; // 이메일 정보 제공 동의 여부
    private String telChk; // 전화번호 정보 제공 동의 여부
    private String addressChk; // 주소지 정보 제공 동의 여부
    private String snsChk; // SNS 주소 정보 제공 동의 여부
    private String profileChk; // 프로필 정보 제공 동의 여부
    private String status; // 상태 (대기, 승인, 거부)
    private String regDate; // 등록 날짜
    private String regId; // 등록자 ID
    private String updDate; // 수정 날짜
    private String updId; // 수정자 ID
    private String deleteYn; // 삭제 여부
    private Integer mSq; // 회원 고유 식별자
    private int firstIndex; // 첫 번째 인덱스

    // Getter 및 Setter 메소드
    public int getSq() {
        return sq;
    }

    public void setSq(int sq) {
        this.sq = sq;
    }

    // 강사 이름에 대한 getter 및 setter
    public String getEncTeacherName() {
        return encTeacherName;
    }

    public void setEncTeacherName(String encTeacherName) {
        this.encTeacherName = encTeacherName;
    }

    // 분야 대분류에 대한 getter 및 setter
    public String getCategory1() {
        return category1;
    }

    public void setCategory1(String category1) {
        this.category1 = category1;
    }

    // 분야 소분류에 대한 getter 및 setter
    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    // 대분류 서브 카테고리에 대한 getter 및 setter
    public String getCategory3() {
        return category3;
    }

    public void setCategory3(String category3) {
        this.category3 = category3;
    }

    // 기타 분류 정보에 대한 getter 및 setter
    public String getCategoryEtc() {
        return categoryEtc;
    }

    public void setCategoryEtc(String categoryEtc) {
        this.categoryEtc = categoryEtc;
    }

    // 전공에 대한 getter 및 setter
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    // 생년월일에 대한 getter 및 setter
    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    // 성별에 대한 getter 및 setter
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    // 이메일에 대한 getter 및 setter
    public String getEncEmail() {
        return encEmail;
    }

    public void setEncEmail(String encEmail) {
        this.encEmail = encEmail;
    }

    // 휴대전화 번호에 대한 getter 및 setter
    public String getEncPhone() {
        return encPhone;
    }

    public void setEncPhone(String encPhone) {
        this.encPhone = encPhone;
    }

    // 일반 전화 번호에 대한 getter 및 setter
    public String getEncTelno() {
        return encTelno;
    }

    public void setEncTelno(String encTelno) {
        this.encTelno = encTelno;
    }

    // 구/군 정보에 대한 getter 및 setter
    public String getGungu() {
        return gungu;
    }

    public void setGungu(String gungu) {
        this.gungu = gungu;
    }

    // 상세 주소에 대한 getter 및 setter
    public String getEncAddressDetail() {
        return encAddressDetail;
    }

    public void setEncAddressDetail(String encAddressDetail) {
        this.encAddressDetail = encAddressDetail;
    }

    // SNS 주소에 대한 getter 및 setter
    public String getEncSns() {
        return encSns;
    }

    public void setEncSns(String encSns) {
        this.encSns = encSns;
    }

    // 자기소개에 대한 getter 및 setter
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    // 프로필 이미지 원본 파일명에 대한 getter 및 setter
    public String getProfileOriginName() {
        return profileOriginName;
    }

    public void setProfileOriginName(String profileOriginName) {
        this.profileOriginName = profileOriginName;
    }

    // 프로필 이미지 저장 파일명에 대한 getter 및 setter
    public String getProfileSaveName() {
        return profileSaveName;
    }

    public void setProfileSaveName(String profileSaveName) {
        this.profileSaveName = profileSaveName;
    }

    // 프로필 이미지 썸네일 파일명에 대한 getter 및 setter
    public String getProfileThumbName() {
        return profileThumbName;
    }

    public void setProfileThumbName(String profileThumbName) {
        this.profileThumbName = profileThumbName;
    }

    // 휴대전화 정보 제공 동의 여부에 대한 getter 및 setter
    public String getPhoneChk() {
        return phoneChk;
    }

    public void setPhoneChk(String phoneChk) {
        this.phoneChk = phoneChk;
    }

    // 이메일 정보 제공 동의 여부에 대한 getter 및 setter
    public String getEmailChk() {
        return emailChk;
    }

    public void setEmailChk(String emailChk) {
        this.emailChk = emailChk;
    }

    // 전화번호 정보 제공 동의 여부에 대한 getter 및 setter
    public String getTelChk() {
        return telChk;
    }

    public void setTelChk(String telChk) {
        this.telChk = telChk;
    }

    // 주소지 정보 제공 동의 여부에 대한 getter 및 setter
    public String getAddressChk() {
        return addressChk;
    }

    public void setAddressChk(String addressChk) {
        this.addressChk = addressChk;
    }

    // SNS 주소 정보 제공 동의 여부에 대한 getter 및 setter
    public String getSnsChk() {
        return snsChk;
    }

    public void setSnsChk(String snsChk) {
        this.snsChk = snsChk;
    }

    // 프로필 정보 제공 동의 여부에 대한 getter 및 setter
    public String getProfileChk() {
        return profileChk;
    }

    public void setProfileChk(String profileChk) {
        this.profileChk = profileChk;
    }

    // 상태에 대한 getter 및 setter
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // 등록 날짜에 대한 getter 및 setter
    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    // 등록자 ID에 대한 getter 및 setter
    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }

    // 수정 날짜에 대한 getter 및 setter
    public String getUpdDate() {
        return updDate;
    }

    public void setUpdDate(String updDate) {
        this.updDate = updDate;
    }

    // 수정자 ID에 대한 getter 및 setter
    public String getUpdId() {
        return updId;
    }

    public void setUpdId(String updId) {
        this.updId = updId;
    }

    // 삭제 여부에 대한 getter 및 setter
    public String getDeleteYn() {
        return deleteYn;
    }

    public void setDeleteYn(String deleteYn) {
        this.deleteYn = deleteYn;
    }

    // 회원 고유 식별자에 대한 getter 및 setter
    public Integer getMSq() {
        return mSq;
    }

    public void setMSq(Integer mSq) {
        this.mSq = mSq;
    }

    // 첫 번째 인덱스에 대한 getter 및 setter
    public int getFirstIndex() {
        return firstIndex;
    }

    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

}
