package kr.or.ifac.modules.portal.survey.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Service;
import kr.or.ifac.modules.portal.survey.service.SurveyManageService;
import kr.or.ifac.modules.portal.survey.service.SurveyMaster;
import kr.or.ifac.modules.portal.survey.service.SurveyMasterVO;

/**
 * 설문조사 관리를 위한 서비스 구현 클래스
 */
@Service("SurveyManageService")
public class SurveyManageServiceImpl extends EgovAbstractServiceImpl implements SurveyManageService {

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name = "surveyManageMapper")
    private SurveyManageMapper surveyManageDAO;
    
    @Override
    public Map<String, Object> selectSurveyList(SurveyMasterVO searchVO) throws Exception {
        List<SurveyMasterVO> result = surveyManageDAO.selectSurveyList(searchVO);
        int cnt = surveyManageDAO.selectSurveyListCnt(searchVO);

        Map<String, Object> map = new HashMap<>();
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }
    
    @Override
    public SurveyMasterVO selectSurvey(SurveyMasterVO searchVO) throws Exception {
        return surveyManageDAO.selectSurvey(searchVO);
    }

    @Override
    public void updateSurvey(SurveyMaster surveyMaster) throws Exception {
        surveyManageDAO.updateSurvey(surveyMaster);
    }

    @Override
    public void insertSurvey(SurveyMaster surveyMaster) throws Exception {
        surveyManageDAO.insertSurvey(surveyMaster);
    }

    @Override
    public void deleteSurvey(SurveyMaster surveyMaster) throws Exception {
        surveyManageDAO.deleteSurvey(surveyMaster);
    }
}