package kr.or.ifac.modules.portal.club.service;

import java.util.Map;

/**
 * 동아리 속성관리를 위한 서비스 인터페이스 클래스
 */
public interface ClubManageService {

	/**
	 * 동아리의 목록을 조회 한다.
	 */
	public Map<String, Object> selectClubList(ClubMasterVO searchVO) throws Exception;

	/**
	 * 동아리의 목록 전체 수를 조회 한다.
	 */
	public int selectClubListTotCnt(ClubMasterVO clubMasterVO) throws Exception;

	/**
	 * 기 등록된 검색조건에 맞는 동아리 정보를 데이터베이스에서 읽어와 화면에 출력
	 */
	public ClubMasterVO selectClub(String sq) throws Exception;

	/**
	 * 화면에 조회된 동아리의 정보를 데이터베이스에서 삭제
	 */
	public void deleteClub(String checkedSqForDel) throws Exception;

	/**
	 * 화면에 조회된 동아리 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 */
	public void updateClub(ClubMasterVO clubMasterVO) throws Exception;

	/**
	 * 동아리 정보 등록
	 */
	public void insertClub(ClubMasterVO clubMasterVO) throws Exception;
	
}