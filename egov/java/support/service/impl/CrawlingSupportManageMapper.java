package kr.or.ifac.modules.portal.support.service.impl;

import java.util.List;
import kr.or.ifac.modules.portal.support.service.CrawlingSupportMasterVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 지원사업 관리를 위한 MyBatis Mapper 인터페이스
 */
@Mapper("crawlingSupportManageMapper")
public interface CrawlingSupportManageMapper {
    
    List<CrawlingSupportMasterVO> selectCrawlingSupportList(CrawlingSupportMasterVO vo) throws Exception;
    
    int selectCrawlingSupportListCnt(CrawlingSupportMasterVO vo) throws Exception;

    CrawlingSupportMasterVO selectCrawlingSupport(String sq) throws Exception;

    void deleteCrawlingSupport(String sq) throws Exception;

    void updateCrawlingSupport(CrawlingSupportMasterVO vo) throws Exception;

    void insertCrawlingSupport(CrawlingSupportMasterVO vo) throws Exception;
}