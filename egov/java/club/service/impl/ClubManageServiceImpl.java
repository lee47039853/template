package kr.or.ifac.modules.portal.club.service.impl;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.com.service.BoardUseInf;
import egovframework.let.cop.com.service.EgovUserInfManageService;
import egovframework.let.cop.com.service.UserInfVO;
import egovframework.let.cop.com.service.impl.BBSUseInfoManageDAO;
import egovframework.let.uss.umt.service.UserManageVO;
import kr.or.ifac.modules.portal.club.service.ClubManageService;
import kr.or.ifac.modules.portal.club.service.ClubMaster;
import kr.or.ifac.modules.portal.club.service.ClubMasterVO;
import kr.or.ifac.modules.portal.survey.service.impl.SurveyManageMapper;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 동아리 관리를 위한 서비스 구현 클래스
 */
@Service("ClubManageService")
public class ClubManageServiceImpl extends EgovAbstractServiceImpl implements ClubManageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ClubManageServiceImpl.class);
	
	@Resource(name = "clubManageMapper")
    private ClubManageMapper clubManageDAO;

	/**
	 * 동아리의 목록을 조회 한다.
	 */
	@Override
	public Map<String, Object> selectClubList(ClubMasterVO searchVO) throws Exception {
		List<ClubMasterVO> result = clubManageDAO.selectClubList(searchVO);
		int cnt = clubManageDAO.selectClubListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);

		return map;
	}
	
	/**
	 * 동아리의 목록 전체 수를 조회 한다.
	 */
	@Override
	public int selectClubListTotCnt(ClubMasterVO clubMasterVO) throws Exception {
		return clubManageDAO.selectClubListCnt(clubMasterVO);
	}

	
	/**
	 * 기 등록된 검색조건에 맞는 동아리 정보를 데이터베이스에서 읽어와 화면에 출력
	 */
	@Override
	public ClubMasterVO selectClub(String sq) throws Exception {
		ClubMasterVO clubMasterVO = clubManageDAO.selectClub(sq);
		return clubMasterVO;
	}

	/**
	 * 화면에 조회된 동아리의 정보를 데이터베이스에서 삭제
	 */
	@Override
	public void deleteClub(String checkedSqForDel) throws Exception {
		String [] delSq = checkedSqForDel.split(",");
		for (int i=0; i<delSq.length ; i++){
			clubManageDAO.deleteClub(delSq[i]);
		}
	}

	/**
	 * 화면에 조회된 동아리 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 */
	@Override
	public void updateClub(ClubMasterVO clubMasterVO) throws Exception {
		clubManageDAO.updateClub(clubMasterVO);
	}

	/**
	 * 동아리 정보 등록
	 */
	@Override
	public void insertClub(ClubMasterVO clubMasterVO) throws Exception {
		clubManageDAO.insertClub(clubMasterVO);
	}

}
