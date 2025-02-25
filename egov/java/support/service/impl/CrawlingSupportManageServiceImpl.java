package kr.or.ifac.modules.portal.support.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ifac.modules.portal.support.service.CrawlingSupportManageService;
import kr.or.ifac.modules.portal.support.service.CrawlingSupportMasterVO;

/**
 * 지원사업 관리를 위한 서비스 구현 클래스
 */
@Service("CrawlingSupportManageService")
public class CrawlingSupportManageServiceImpl extends EgovAbstractServiceImpl implements CrawlingSupportManageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CrawlingSupportManageServiceImpl.class);
    
    @Resource(name = "crawlingSupportManageMapper")
    private CrawlingSupportManageMapper crawlingSupportManageDAO;

    @Override
    public Map<String, Object> selectCrawlingSupportList(CrawlingSupportMasterVO searchVO) throws Exception {
        List<CrawlingSupportMasterVO> result = crawlingSupportManageDAO.selectCrawlingSupportList(searchVO);
        int cnt = crawlingSupportManageDAO.selectCrawlingSupportListCnt(searchVO);

        Map<String, Object> map = new HashMap<>();

        map.put("resultList", result);
        map.put("totalRecordCount", cnt);

        return map;
    }
    
    @Override
    public int selectCrawlingSupportListTotCnt(CrawlingSupportMasterVO searchVO) throws Exception {
        return crawlingSupportManageDAO.selectCrawlingSupportListCnt(searchVO);
    }
    
    @Override
    public CrawlingSupportMasterVO selectCrawlingSupport(String sq) throws Exception {
        return crawlingSupportManageDAO.selectCrawlingSupport(sq);
    }
    
    @Override
    public void deleteCrawlingSupport(String checkedSqForDel) throws Exception {
        String[] delSq = checkedSqForDel.split(",");
        for (String sq : delSq) {
            crawlingSupportManageDAO.deleteCrawlingSupport(sq);
        }
    }
    
    @Override
    public void updateCrawlingSupport(CrawlingSupportMasterVO vo) throws Exception {
        crawlingSupportManageDAO.updateCrawlingSupport(vo);
    }
    
    @Override
    public void insertCrawlingSupport(CrawlingSupportMasterVO vo) throws Exception {
        crawlingSupportManageDAO.insertCrawlingSupport(vo);
    }
}