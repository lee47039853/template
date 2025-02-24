package kr.or.ifac.modules.portal.survey.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ifac.modules.portal.survey.service.SurveyManageService;
import kr.or.ifac.modules.portal.survey.service.SurveyMasterVO;

/**
 * 설문조사 관리를 위한 서비스 구현 클래스
 */
@Service("SurveyManageService")
public class SurveyManageServiceImpl extends EgovAbstractServiceImpl implements SurveyManageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(SurveyManageServiceImpl.class);
    
    @Resource(name = "surveyManageMapper")
    private SurveyManageMapper surveyManageDAO;

    @Override
    public Map<String, Object> selectSurveyList(SurveyMasterVO searchVO) throws Exception {
        List<SurveyMasterVO> result = surveyManageDAO.selectSurveyList(searchVO);
        int cnt = surveyManageDAO.selectSurveyListCnt(searchVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);

        return map;
    }
    
    @Override
    public int selectSurveyListTotCnt(SurveyMasterVO surveyMasterVO) throws Exception {
        return surveyManageDAO.selectSurveyListCnt(surveyMasterVO);
    }
    
    @Override
    public SurveyMasterVO selectSurvey(String sq) throws Exception {
        SurveyMasterVO surveyMasterVO = surveyManageDAO.selectSurvey(sq);
        return surveyMasterVO;
    }
    
    @Override
    public void deleteSurvey(String checkedSqForDel) throws Exception {
        String[] delSq = checkedSqForDel.split(",");
        for (int i = 0; i < delSq.length ; i++) {
            surveyManageDAO.deleteSurvey(delSq[i]);
        }
    }
    
    @Override
    public void updateSurvey(SurveyMasterVO surveyMasterVO) throws Exception {
        surveyManageDAO.updateSurvey(surveyMasterVO);
    }
    
    @Override
    public void insertSurvey(SurveyMasterVO surveyMasterVO) throws Exception {
        surveyManageDAO.insertSurvey(surveyMasterVO);
    }
}