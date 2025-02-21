package kr.or.ifac.modules.portal.teacher.web;

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
import kr.or.ifac.modules.portal.teacher.service.TeacherManageService;
import kr.or.ifac.modules.portal.teacher.service.TeacherMaster;
import kr.or.ifac.modules.portal.teacher.service.TeacherMasterVO;

/**
 * 웹포털 강사 관리를 위한 컨트롤러 클래스
 */
@Controller
@RequestMapping("/portal")
public class TeacherManageController {
    @Resource(name = "TeacherManageService")
    private TeacherManageService teacherManageService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired
    private DefaultBeanValidator beanValidator;

    @RequestMapping("/teacher/SelectTeacherList.do")
    public String selectTeacherList(@ModelAttribute("searchVO") TeacherMasterVO teacherMasterVO, ModelMap model, HttpServletRequest request) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        request.getSession().setAttribute("baseMenuNo", "4000000");
        setPagination(teacherMasterVO);

        Map<String, Object> map = teacherManageService.selectTeacherList(teacherMasterVO);
        int totCnt = Integer.parseInt((String) map.get("resultCnt"));

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setTotalRecordCount(totCnt);
        paginationInfo.setCurrentPageNo(teacherMasterVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(teacherMasterVO.getPageUnit());
        paginationInfo.setPageSize(teacherMasterVO.getPageSize());
        teacherMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        teacherMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
        teacherMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("clubCode_result", getCommonCodeDetails("COM008"));
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("paginationInfo", paginationInfo);

        return "portal/teacher/PortalTeacherList";
    }

    @RequestMapping("/teacher/SelectTeacher.do")
    public String selectTeacher(@ModelAttribute("searchVO") TeacherMasterVO searchVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        TeacherMasterVO teacherMaster = teacherManageService.selectTeacher(searchVO);
        model.addAttribute("teacherMaster", teacherMaster);
        model.addAttribute("teacherCode_result", getCommonCodeDetails("COM008"));
        model.addAttribute("typeList", getCommonCodeDetails("COM006"));

        return "portal/teacher/PortalTeacherUpt";
    }

    @RequestMapping("/teacher/UpdateTeacher.do")
    public String updateTeacher(@ModelAttribute("searchVO") TeacherMasterVO teacherMasterVO, @ModelAttribute("teacherMaster") TeacherMaster teacherMaster, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        teacherMaster.setUpdId(user.getUniqId());
        teacherManageService.updateTeacher(teacherMaster);

        return "forward:/portal/teacher/SelectTeacherList.do";
    }

    @RequestMapping("/teacher/AddTeacher.do")
    public String addTeacher(@ModelAttribute("searchVO") TeacherMasterVO teacherMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        model.addAttribute("typeList", getCommonCodeDetails("COM008"));
        model.addAttribute("attrbList", getCommonCodeDetails("COM008"));
        model.addAttribute("teacherMaster", new TeacherMaster());

        return "portal/teacher/PortalTeacherRegist";
    }

    @RequestMapping("/teacher/InsertTeacher.do")
    public String insertTeacher(@ModelAttribute("searchVO") TeacherMasterVO teacherMasterVO, @ModelAttribute("teacherMaster") TeacherMaster teacherMaster, SessionStatus status, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        teacherMaster.setRegId(user.getUniqId());
        teacherMaster.setDeleteYn("N");
        teacherManageService.insertTeacher(teacherMaster);

        return "forward:/portal/teacher/SelectTeacherList.do";
    }

    @RequestMapping("/teacher/DeleteTeacher.do")
    public String deleteTeacher(@ModelAttribute("searchVO") TeacherMasterVO teacherMasterVO, @ModelAttribute("teacherMaster") TeacherMaster teacherMaster, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        teacherMaster.setUpdId(user.getUniqId());
        teacherManageService.deleteTeacher(teacherMaster);
        model.addAttribute("resultMsg", "success.common.delete");

        return "forward:/portal/teacher/SelectTeacherList.do";
    }

    private boolean isAuthenticated(ModelMap model) {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        }
        return isAuthenticated;
    }

    private List<?> getCommonCodeDetails(String codeId) throws Exception {
        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        vo.setCodeId(codeId);
        return cmmUseService.selectCmmCodeDetail(vo);
    }

    private void setPagination(TeacherMasterVO teacherMasterVO) {
        teacherMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
        teacherMasterVO.setPageSize(propertyService.getInt("pageSize"));
    }
}