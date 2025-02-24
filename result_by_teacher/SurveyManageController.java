package kr.or.ifac.modules.portal.survey.web;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import kr.or.ifac.modules.portal.survey.service.SurveyManageService;
import kr.or.ifac.modules.portal.survey.service.SurveyMaster;
import kr.or.ifac.modules.portal.survey.service.SurveyMasterVO;

/**
 * 웹포털 설문조사 관리를 위한 컨트롤러 클래스
 */
@Controller
@RequestMapping("/portal")
public class SurveyManageController {
    @Resource(name = "SurveyManageService")
    private SurveyManageService surveyManageService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired
    private DefaultBeanValidator beanValidator;

    @RequestMapping("/survey/SelectSurveyList.do")
    public String selectSurveyList(@ModelAttribute("searchVO") SurveyMasterVO surveyMasterVO, ModelMap model, HttpServletRequest request) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        request.getSession().setAttribute("baseMenuNo", "4000000");
        setPagination(surveyMasterVO);

        Map<String, Object> map = surveyManageService.selectSurveyList(surveyMasterVO);
        int totCnt = Integer.parseInt((String) map.get("resultCnt"));

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setTotalRecordCount(totCnt);
        paginationInfo.setCurrentPageNo(surveyMasterVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(surveyMasterVO.getPageUnit());
        paginationInfo.setPageSize(surveyMasterVO.getPageSize());
        
        surveyMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        surveyMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
        surveyMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("paginationInfo", paginationInfo);

        return "portal/survey/PortalSurveyList";
    }

    @RequestMapping("/survey/SelectSurvey.do")
    public String selectSurvey(@ModelAttribute("searchVO") SurveyMasterVO searchVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        SurveyMasterVO surveyMaster = surveyManageService.selectSurvey(searchVO);
        model.addAttribute("surveyMaster", surveyMaster);

        return "portal/survey/PortalSurveyUpt";
    }

    @RequestMapping("/survey/UpdateSurvey.do")
    public String updateSurvey(@ModelAttribute("searchVO") SurveyMasterVO surveyMasterVO, @ModelAttribute("surveyMaster") SurveyMaster surveyMaster, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        //LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        //surveyMaster.setUpdId(user.getUniqId());
        surveyManageService.updateSurvey(surveyMaster);

        return "forward:/portal/survey/SelectSurveyList.do";
    }

    @RequestMapping("/survey/AddSurvey.do")
    public String addSurvey(@ModelAttribute("searchVO") SurveyMasterVO surveyMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        model.addAttribute("surveyMaster", new SurveyMaster());

        return "portal/survey/PortalSurveyRegist";
    }

    @RequestMapping("/survey/InsertSurvey.do")
    public String insertSurvey(@ModelAttribute("searchVO") SurveyMasterVO surveyMasterVO, @ModelAttribute("surveyMaster") SurveyMaster surveyMaster, SessionStatus status, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        //LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        //surveyMaster.setRegId(user.getUniqId());
        surveyManageService.insertSurvey(surveyMaster);

        return "forward:/portal/survey/SelectSurveyList.do";
    }

    @RequestMapping("/survey/DeleteSurvey.do")
    public String deleteSurvey(@ModelAttribute("searchVO") SurveyMasterVO surveyMasterVO, @ModelAttribute("surveyMaster") SurveyMaster surveyMaster, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        //LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        //surveyMaster.setUpdId(user.getUniqId());
        surveyManageService.deleteSurvey(surveyMaster);
        model.addAttribute("resultMsg", "success.common.delete");

        return "forward:/portal/survey/SelectSurveyList.do";
    }

    private boolean isAuthenticated(ModelMap model) {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        }
        return isAuthenticated;
    }

    private void setPagination(SurveyMasterVO surveyMasterVO) {
        surveyMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
        surveyMasterVO.setPageSize(propertyService.getInt("pageSize"));
    }
}