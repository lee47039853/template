package kr.or.ifac.modules.portal.club.service.impl;

import java.util.List;
import kr.or.ifac.modules.portal.club.service.ClubMasterVO;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 설문조사 관리를 위한 MyBatis Mapper 인터페이스
 */
@Mapper("clubManageMapper")
public interface ClubManageMapper {
    
    List<ClubMasterVO> selectClubList(ClubMasterVO vo) throws Exception;
    
    int selectClubListCnt(ClubMasterVO vo) throws Exception;

    ClubMasterVO selectClub(String sq) throws Exception;

	void deleteClub(String sq) throws Exception;

	void updateClub(ClubMasterVO vo) throws Exception;

	void insertClub(ClubMasterVO vo) throws Exception;
    
}