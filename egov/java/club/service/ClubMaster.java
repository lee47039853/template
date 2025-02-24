package kr.or.ifac.modules.portal.club.service;

import java.io.Serializable;

/**
 * 동아리 속성 정보를 담기 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class ClubMaster implements Serializable {
	/** 연번 */
	private int sq;

	/** 동아리 이름 */
	private String clubName;

	/** 활동지역(시) */
	private String activityAreaSi;

	/** 활동지역(군/구) */
	private String activityAreaGungu;

	/** 동아리 장르 */
	private String clubGenre;

	/** 대표 연락처 */
	private String phone;

	/** 활동인원 */
	private String memberCount;

	/** 간단한 소개 */
	private String shortIntroduce;
	
	/** 에디터 소개 */
	private String longIntroduce;

	/** 상세 소개 */
	private String detailIntro;

	/** 대표이미지 원본 이름 */
	private String mainImgOriginName;

	/** 대표이미지 저장 이름 */
	private String mainImgSaveName;

	/** 대표이미지 썸네일 이름 */
	private String mainImgThumbName;

	/** 활동 시작일 */
	private String startDate;

	/** 커뮤니티 URL (SNS 등) */
	private String communityUrl;

	/** 태그 */
	private String tag;

	/** 상태 (Wait, Accept, Deny) */
	private String status;

	/** 매개자 */
	private String intermediary;

	/** 모임 장소 */
	private String meetingPlace;

	/** 등록 날짜 */
	private String regDate;

	/** 등록자 */
	private String regId;

	/** 수정 날짜 */
	private String updDate;

	/** 수정자 */
	private String updId;

	/** 삭제 여부 (Y, N) */
	private String deleteYn;

	// 기본 생성자
	public ClubMaster() {}

	// 모든 필드를 포함하는 생성자
	public ClubMaster(int sq, String clubName, String activityAreaSi, String activityAreaGungu, String clubGenre,
			String phone, String memberCount, String shortIntroduce, String longIntroduce, String detailIntro, String mainImgOriginName,
			String mainImgSaveName, String mainImgThumbName, String startDate, String communityUrl, String tag,
			String status, String intermediary, String meetingPlace, String regDate, String regId,
			String updDate, String updId, String deleteYn) {
		this.sq = sq;
		this.clubName = clubName;
		this.activityAreaSi = activityAreaSi;
		this.activityAreaGungu = activityAreaGungu;
		this.clubGenre = clubGenre;
		this.phone = phone;
		this.memberCount = memberCount;
		this.shortIntroduce = shortIntroduce;
		this.longIntroduce = longIntroduce;
		this.detailIntro = detailIntro;
		this.mainImgOriginName = mainImgOriginName;
		this.mainImgSaveName = mainImgSaveName;
		this.mainImgThumbName = mainImgThumbName;
		this.startDate = startDate;
		this.communityUrl = communityUrl;
		this.tag = tag;
		this.status = status;
		this.intermediary = intermediary;
		this.meetingPlace = meetingPlace;
		this.regDate = regDate;
		this.regId = regId;
		this.updDate = updDate;
		this.updId = updId;
		this.deleteYn = deleteYn;
	}

	// Getters and Setters
	public int getSq() { return sq; }
	public void setSq(int sq) { this.sq = sq; }

	public String getClubName() { return clubName; }
	public void setClubName(String clubName) { this.clubName = clubName; }

	public String getActivityAreaSi() { return activityAreaSi; }
	public void setActivityAreaSi(String activityAreaSi) { this.activityAreaSi = activityAreaSi; }

	public String getActivityAreaGungu() { return activityAreaGungu; }
	public void setActivityAreaGungu(String activityAreaGungu) { this.activityAreaGungu = activityAreaGungu; }

	public String getClubGenre() { return clubGenre; }
	public void setClubGenre(String clubGenre) { this.clubGenre = clubGenre; }

	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }

	public String getMemberCount() { return memberCount; }
	public void setMemberCount(String memberCount) { this.memberCount = memberCount; }

	public String getShortIntroduce() { return shortIntroduce; }
	public void setShortIntroduce(String shortIntroduce) { this.shortIntroduce = shortIntroduce; }

	public String getLongIntroduce() { return longIntroduce; }
	public void setLongIntroduce(String longIntroduce) { this.longIntroduce = longIntroduce; }

	public String getDetailIntro() { return detailIntro; }
	public void setDetailIntro(String detailIntro) { this.detailIntro = detailIntro; }

	public String getMainImgOriginName() { return mainImgOriginName; }
	public void setMainImgOriginName(String mainImgOriginName) { this.mainImgOriginName = mainImgOriginName; }

	public String getMainImgSaveName() { return mainImgSaveName; }
	public void setMainImgSaveName(String mainImgSaveName) { this.mainImgSaveName = mainImgSaveName; }

	public String getMainImgThumbName() { return mainImgThumbName; }
	public void setMainImgThumbName(String mainImgThumbName) { this.mainImgThumbName = mainImgThumbName; }

	public String getStartDate() { return startDate; }
	public void setStartDate(String startDate) { this.startDate = startDate; }

	public String getCommunityUrl() { return communityUrl; }
	public void setCommunityUrl(String communityUrl) { this.communityUrl = communityUrl; }

	public String getTag() { return tag; }
	public void setTag(String tag) { this.tag = tag; }

	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }

	public String getIntermediary() { return intermediary; }
	public void setIntermediary(String intermediary) { this.intermediary = intermediary; }

	public String getMeetingPlace() { return meetingPlace; }
	public void setMeetingPlace(String meetingPlace) { this.meetingPlace = meetingPlace; }

	public String getRegDate() { return regDate; }
	public void setRegDate(String regDate) { this.regDate = regDate; }

	public String getRegId() { return regId; }
	public void setRegId(String regId) { this.regId = regId; }

	public String getUpdDate() { return updDate; }
	public void setUpdDate(String updDate) { this.updDate = updDate; }

	public String getUpdId() { return updId; }
	public void setUpdId(String updId) { this.updId = updId; }

	public String getDeleteYn() { return deleteYn; }
	public void setDeleteYn(String deleteYn) { this.deleteYn = deleteYn; }
	
	
}
