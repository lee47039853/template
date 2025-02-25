package kr.or.ifac.modules.portal.support.web;

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

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import kr.or.ifac.modules.portal.support.service.CrawlingSupportManageService;
import kr.or.ifac.modules.portal.support.service.CrawlingSupportMasterVO;
import kr.or.ifac.utils.cmm.StringSanitizer;

/**
 * 웹포털 지원사업 관리를 위한 컨트롤러 클래스
 */
@Controller
@RequestMapping("/portal")
public class CrawlingSupportManageController {
    @Resource(name = "CrawlingSupportManageService")
    private CrawlingSupportManageService crawlingSupportManageService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @RequestMapping("/support/SelectCrawlingSupportList.do")
    public String selectCrawlingSupportList(@ModelAttribute("crawlingSupportMasterVO") CrawlingSupportMasterVO crawlingSupportMasterVO, ModelMap model, HttpServletRequest request) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        request.getSession().setAttribute("baseMenuNo", "4000000");
        
        crawlingSupportMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
        crawlingSupportMasterVO.setPageSize(propertyService.getInt("pageSize"));

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(crawlingSupportMasterVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(crawlingSupportMasterVO.getPageUnit());
        paginationInfo.setPageSize(crawlingSupportMasterVO.getPageSize());
        
        crawlingSupportMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        crawlingSupportMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
        crawlingSupportMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        Map<String, Object> map = crawlingSupportManageService.selectCrawlingSupportList(crawlingSupportMasterVO);
        int totCnt = crawlingSupportManageService.selectCrawlingSupportListTotCnt(crawlingSupportMasterVO);
        paginationInfo.setTotalRecordCount(totCnt);
        
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("paginationInfo", paginationInfo);

        return "portal/support/PortalCrawlingSupportList";
    }

    @RequestMapping("/support/SupportInsertView.do")
    public String insertSupportView(@ModelAttribute("crawlingSupportMasterVO") CrawlingSupportMasterVO crawlingSupportMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        return "portal/support/PortalCrawlingSupportInsert";
    }

    @RequestMapping("/support/SupportInsert.do")
    public String insertSupport(@ModelAttribute("crawlingSupportMasterVO") CrawlingSupportMasterVO crawlingSupportMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        // 모든 문자열 필드에 대해 특수문자 변환 자동 적용
        StringSanitizer.sanitizeForDatabase(crawlingSupportMasterVO);
        crawlingSupportManageService.insertCrawlingSupport(crawlingSupportMasterVO);
        model.addAttribute("resultMsg", "success.common.insert");
        return "forward:/portal/support/SelectCrawlingSupportList.do";
    }

    @RequestMapping("/support/SupportSelectUpdtView.do")
    public String updateSupportView(@RequestParam("selectedSq") String sq, @ModelAttribute("crawlingSupportMasterVO") CrawlingSupportMasterVO crawlingSupportMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        CrawlingSupportMasterVO supportManageVO = crawlingSupportManageService.selectCrawlingSupport(sq);
        model.addAttribute("crawlingSupportMasterVO", supportManageVO);

        return "portal/support/PortalCrawlingSupportSelectUpdt";
    }

    @RequestMapping("/support/SupportSelectUpdt.do")
    public String updateSupport(@ModelAttribute("crawlingSupportMasterVO") CrawlingSupportMasterVO crawlingSupportMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";
        
        // 모든 문자열 필드에 대해 특수문자 변환 자동 적용
        StringSanitizer.sanitizeForDatabase(crawlingSupportMasterVO);
        crawlingSupportManageService.updateCrawlingSupport(crawlingSupportMasterVO);
        model.addAttribute("resultMsg", "success.common.update");
        return "forward:/portal/support/SelectCrawlingSupportList.do";
    }

    @RequestMapping("/support/SupportDelete.do")
    public String deleteSupport(@RequestParam("checkedSqForDel") String checkedSqForDel, @ModelAttribute("crawlingSupportMasterVO") CrawlingSupportMasterVO crawlingSupportMasterVO, ModelMap model) throws Exception {
        if (!isAuthenticated(model)) return "uat/uia/EgovLoginUsr";

        crawlingSupportManageService.deleteCrawlingSupport(checkedSqForDel);
        model.addAttribute("resultMsg", "success.common.delete");
        return "forward:/portal/support/SelectCrawlingSupportList.do";
    }

    private boolean isAuthenticated(ModelMap model) {
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        }
        return isAuthenticated;
    }
}