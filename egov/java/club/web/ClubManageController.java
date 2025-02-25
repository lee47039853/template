package kr.or.ifac.modules.portal.club.web;

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
import kr.or.ifac.modules.portal.club.service.ClubManageService;
import kr.or.ifac.modules.portal.club.service.ClubMasterVO;
import kr.or.ifac.utils.cmm.StringSanitizer;

/**
 * 웹포털 동아리 관리를 위한 컨트롤러 클래스
 */
@Controller
@RequestMapping("/portal")
public class ClubManageController {
    /** ClubManageService */
    @Resource(name = "ClubManageService")
    private ClubManageService clubManageService;

    /** cmmUseService */
    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    /**
     * 동아리 목록을 조회한다.
     */
    @RequestMapping("/club/SelectClubList.do")
    public String selectClubList(@ModelAttribute("clubMasterVO") ClubMasterVO clubMasterVO, ModelMap model, HttpServletRequest request) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        // 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
        request.getSession().setAttribute("baseMenuNo", "4000000");
        
    	clubMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
    	clubMasterVO.setPageSize(propertyService.getInt("pageSize"));

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(clubMasterVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(clubMasterVO.getPageUnit());
        paginationInfo.setPageSize(clubMasterVO.getPageSize());
        
        clubMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        clubMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
        clubMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        Map<String, Object> map = clubManageService.selectClubList(clubMasterVO);
        int totCnt = clubManageService.selectClubListTotCnt(clubMasterVO);
        paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute("clubGenreCode_result", getCommonCodeDetails("COM002"));
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("paginationInfo", paginationInfo);

        return "portal/club/PortalClubList";
    }

    /**
     * 동아리 등록 화면으로 이동한다.
     */
    @RequestMapping("/club/ClubInsertView.do")
    public String insertClubView(@ModelAttribute("clubMasterVO") ClubMasterVO clubMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        model.addAttribute("clubGenreCode_result", getCommonCodeDetails("COM002"));
        model.addAttribute("clubActivityAreaGunguCode_result", getCommonCodeDetails("COM006"));
        model.addAttribute("years", generateYearMap(100));
        return "portal/club/PortalClubInsert";
    }

    /**
     * 동아리 등록 처리후 목록화면으로 이동한다.
     */
    @RequestMapping("/club/ClubInsert.do")
    public String insertClub(@ModelAttribute("clubMasterVO") ClubMasterVO clubMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        clubMasterVO.setRegId(user.getId());
        
        // 모든 문자열 필드에 대해 특수문자 변환 자동 적용
        StringSanitizer.sanitizeForDatabase(clubMasterVO);
        clubManageService.insertClub(clubMasterVO);
        model.addAttribute("resultMsg", "success.common.insert");
        return "forward:/portal/club/SelectClubList.do";

    }

    /**
     * 동아리정보 수정을 위해 정보를 상세조회한다.
     */
    @RequestMapping("/club/ClubSelectUpdtView.do")
    public String updateClubView(@RequestParam("selectedSq") String sq, @ModelAttribute("clubMasterVO") ClubMasterVO clubMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        model.addAttribute("clubGenreCode_result", getCommonCodeDetails("COM002"));
        model.addAttribute("clubActivityAreaGunguCode_result", getCommonCodeDetails("COM006"));
        model.addAttribute("years", generateYearMap(100));
        
        ClubMasterVO clubManageVO = clubManageService.selectClub(sq);
        model.addAttribute("clubMasterVO", clubManageVO);

        return "portal/club/PortalClubSelectUpdt";
    }

    /**
     * 동아리정보 수정 처리후 목록조회 화면으로 이동한다.
     */
    @RequestMapping("/club/ClubSelectUpdt.do")
    public String updateClub(@ModelAttribute("clubMasterVO") ClubMasterVO clubMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        clubMasterVO.setUpdId(user.getId());
        
        // 모든 문자열 필드에 대해 특수문자 변환 자동 적용
        StringSanitizer.sanitizeForDatabase(clubMasterVO);
        clubManageService.updateClub(clubMasterVO);
        model.addAttribute("resultMsg", "success.common.update");
        return "forward:/portal/club/SelectClubList.do";

    }

    /**
     * 동아리 정보 삭제후 목록조회 화면으로 이동한다.
     */
    @RequestMapping("/club/ClubDelete.do")
    public String deleteClub(@RequestParam("checkedSqForDel") String checkedSqForDel, @ModelAttribute("clubMasterVO") ClubMasterVO clubMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        clubManageService.deleteClub(checkedSqForDel);
        model.addAttribute("resultMsg", "success.common.delete");
        return "forward:/portal/club/SelectClubList.do";
    }

    /**
     * 현재 연도를 기준으로 지정된 개수만큼 과거 연도를 생성하는 메서드
     * @param count 생성할 연도의 개수
     * @return 연도 맵 (key: "2025", value: "2025년" 형식)
     */
    private Map<String, String> generateYearMap(int count) {
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        Map<String, String> yearMap = new LinkedHashMap<>(); // 순서 유지
        for (int i = 0; i < count; i++) {
            int year = currentYear - i;
            yearMap.put(String.valueOf(year), year + "년");
        }
        return yearMap;
    }

    /**
     * 공통 코드 상세 목록을 조회한다.
     * @param codeId 코드 ID
     * @return 코드 상세 목록
     * @throws Exception 예외
     */
    private List<?> getCommonCodeDetails(String codeId) throws Exception {
        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        vo.setCodeId(codeId);
        return cmmUseService.selectCmmCodeDetail(vo);
    }


    /**
     * 사용자 인증 여부를 확인하고, 인증되지 않은 경우 로그인 페이지로 리다이렉트한다.
     */
    private boolean isAuthenticated(ModelMap model) {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        }
        return isAuthenticated;
    }
}