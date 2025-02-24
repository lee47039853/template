package kr.or.ifac.modules.portal.survey.service;

import java.util.Map;

/**
 * 설문조사 속성관리를 위한 서비스 인터페이스 클래스
 */
public interface SurveyManageService {

    public Map<String, Object> selectSurveyList(SurveyMasterVO searchVO) throws Exception;

    public int selectSurveyListTotCnt(SurveyMasterVO surveyMasterVO) throws Exception;

    public SurveyMasterVO selectSurvey(String sq) throws Exception;

    public void deleteSurvey(String checkedSqForDel) throws Exception;

    public void updateSurvey(SurveyMasterVO surveyMasterVO) throws Exception;

    public void insertSurvey(SurveyMasterVO surveyMasterVO) throws Exception;

}