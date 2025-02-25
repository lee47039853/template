package kr.or.ifac.modules.portal.support.service;

import java.util.Map;

/**
 * 지원사업 속성관리를 위한 서비스 인터페이스 클래스
 */
public interface CrawlingSupportManageService {

    Map<String, Object> selectCrawlingSupportList(CrawlingSupportMasterVO searchVO) throws Exception;

    int selectCrawlingSupportListTotCnt(CrawlingSupportMasterVO searchVO) throws Exception;

    CrawlingSupportMasterVO selectCrawlingSupport(String sq) throws Exception;

    void deleteCrawlingSupport(String checkedSqForDel) throws Exception;

    void updateCrawlingSupport(CrawlingSupportMasterVO vo) throws Exception;

    void insertCrawlingSupport(CrawlingSupportMasterVO vo) throws Exception;
}