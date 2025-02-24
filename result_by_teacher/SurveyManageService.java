package kr.or.ifac.modules.portal.survey.service;

import java.util.Map;

/**
 * 설문조사 속성관리를 위한 서비스 인터페이스 클래스
 */
public interface SurveyManageService {
    
    Map<String, Object> selectSurveyList(SurveyMasterVO searchVO) throws Exception;
    
    SurveyMasterVO selectSurvey(SurveyMasterVO searchVO) throws Exception;
    
    void updateSurvey(SurveyMaster surveyMaster) throws Exception;
    
    void insertSurvey(SurveyMaster surveyMaster) throws Exception;
    
    void deleteSurvey(SurveyMaster surveyMaster) throws Exception;
}