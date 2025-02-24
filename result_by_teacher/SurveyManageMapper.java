package kr.or.ifac.modules.portal.survey.service.impl;

import java.util.List;
import kr.or.ifac.modules.portal.survey.service.SurveyMaster;
import kr.or.ifac.modules.portal.survey.service.SurveyMasterVO;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 설문조사 관리를 위한 MyBatis Mapper 인터페이스
 */
@Mapper("surveyManageMapper")
public interface SurveyManageMapper {
    
    List<SurveyMasterVO> selectSurveyList(SurveyMasterVO vo) throws Exception;

    int selectSurveyListCnt(SurveyMasterVO vo) throws Exception;

    SurveyMasterVO selectSurvey(SurveyMasterVO vo) throws Exception;

    void updateSurvey(SurveyMaster surveyMaster) throws Exception;

    void insertSurvey(SurveyMaster surveyMaster) throws Exception;

    void deleteSurvey(SurveyMaster surveyMaster) throws Exception;
}