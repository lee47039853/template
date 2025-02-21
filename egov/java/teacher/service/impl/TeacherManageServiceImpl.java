package kr.or.ifac.modules.portal.teacher.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Service;

import kr.or.ifac.modules.portal.teacher.service.TeacherManageService;
import kr.or.ifac.modules.portal.teacher.service.TeacherMaster;
import kr.or.ifac.modules.portal.teacher.service.TeacherMasterVO;

/**
 * 강사 관리를 위한 서비스 구현 클래스
 */
@Service("TeacherManageService")
public class TeacherManageServiceImpl extends EgovAbstractServiceImpl implements TeacherManageService {
	//private static final Logger LOGGER = LoggerFactory.getLogger(TeacherManageServiceImpl.class);

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Resource(name = "TeacherManageDAO")
	private TeacherManageMapper teacherManageDAO;
	
	@Override
	public Map<String, Object> selectTeacherList(TeacherMasterVO searchVO) throws Exception {
		List<TeacherMasterVO> result = teacherManageDAO.selectTeacherList(searchVO);
		int cnt = teacherManageDAO.selectTeacherListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	@Override
    public TeacherMasterVO selectTeacher(TeacherMasterVO searchVO) throws Exception {

    	TeacherMasterVO result = teacherManageDAO.selectTeacher(searchVO);	
		return result;

    }
    
    @Override
    public void updateTeacher(TeacherMaster teacherMaster) throws Exception {
    	teacherManageDAO.updateTeacher(teacherMaster);
    }
    
    @Override
	public void insertTeacher(TeacherMaster teacherMaster) throws Exception {
		teacherManageDAO.insertTeacher(teacherMaster);
	}
	
	@Override
    public void deleteTeacher(TeacherMaster teacherMaster) throws Exception {
    	teacherManageDAO.deleteTeacher(teacherMaster);
    }


}
