package kr.or.ifac.modules.portal.survey.web;

import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import kr.or.ifac.modules.portal.survey.service.SurveyManageService;
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

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @RequestMapping("/survey/SelectSurveyList.do")
    public String selectSurveyList(@ModelAttribute("surveyMasterVO") SurveyMasterVO surveyMasterVO, ModelMap model, HttpServletRequest request) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        request.getSession().setAttribute("baseMenuNo", "4000000");
        setPagination(surveyMasterVO);

        Map<String, Object> map = surveyManageService.selectSurveyList(surveyMasterVO);
        int totCnt = surveyManageService.selectSurveyListTotCnt(surveyMasterVO);

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setTotalRecordCount(totCnt);
        paginationInfo.setCurrentPageNo(surveyMasterVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(surveyMasterVO.getPageUnit());
        paginationInfo.setPageSize(surveyMasterVO.getPageSize());
        
        surveyMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        surveyMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
        surveyMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("paginationInfo", paginationInfo);

        return "portal/survey/PortalSurveyList";
    }

    @RequestMapping("/survey/SurveyInsertView.do")
    public String insertSurveyView(@ModelAttribute("surveyMasterVO") SurveyMasterVO surveyMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        return "portal/survey/PortalSurveyInsert";
    }

    @RequestMapping("/survey/SurveyInsert.do")
    public String insertSurvey(@ModelAttribute("surveyMasterVO") SurveyMasterVO surveyMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        surveyMasterVO.setRegistId(user.getId());
        surveyManageService.insertSurvey(surveyMasterVO);
        model.addAttribute("resultMsg", "success.common.insert");
        return "forward:/portal/survey/SelectSurveyList.do";

    }

    @RequestMapping("/survey/SurveySelectUpdtView.do")
    public String updateSurveyView(@RequestParam("selectedSq") String sq, @ModelAttribute("surveyMasterVO") SurveyMasterVO surveyMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        SurveyMasterVO surveyManageVO = surveyManageService.selectSurvey(sq);
        model.addAttribute("surveyMasterVO", surveyManageVO);

        return "portal/survey/PortalSurveySelectUpdt";
    }

    @RequestMapping("/survey/SurveySelectUpdt.do")
    public String updateSurvey(@ModelAttribute("surveyMasterVO") SurveyMasterVO surveyMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        surveyMasterVO.setRegistId(user.getId());
        
        surveyManageService.updateSurvey(surveyMasterVO);
        model.addAttribute("resultMsg", "success.common.update");
        return "forward:/portal/survey/SelectSurveyList.do";

    }

    @RequestMapping("/survey/SurveyDelete.do")
    public String deleteSurvey(@RequestParam("checkedSqForDel") String checkedSqForDel, @ModelAttribute("surveyMasterVO") SurveyMasterVO surveyMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        surveyManageService.deleteSurvey(checkedSqForDel);
        model.addAttribute("resultMsg", "success.common.delete");
        return "forward:/portal/survey/SelectSurveyList.do";
    }

    private Map<String, String> generateYearMap(int count) {
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        Map<String, String> yearMap = new LinkedHashMap<>();
        for (int i = 0; i < count; i++) {
            int year = currentYear - i;
            yearMap.put(String.valueOf(year), year + "년");
        }
        return yearMap;
    }

    private List<?> getCommonCodeDetails(String codeId) throws Exception {
        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        vo.setCodeId(codeId);
        return cmmUseService.selectCmmCodeDetail(vo);
    }

    private void setPagination(SurveyMasterVO surveyMasterVO) {
        surveyMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
        surveyMasterVO.setPageSize(propertyService.getInt("pageSize"));
    }

    private boolean isAuthenticated(ModelMap model) {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        }
        return isAuthenticated;
    }
}