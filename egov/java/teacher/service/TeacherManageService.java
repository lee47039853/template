package kr.or.ifac.modules.portal.teacher.service;

import java.util.Map;

/**
 * 강사 속성관리를 위한 서비스 인터페이스 클래스
 */
public interface TeacherManageService {


	public Map<String, Object> selectTeacherList(TeacherMasterVO searchVO) throws Exception;
	
	public TeacherMasterVO selectTeacher(TeacherMasterVO searchVO) throws Exception;
	
	public void updateTeacher(TeacherMaster teacherMaster) throws Exception;

	public void insertTeacher(TeacherMaster teacherMaster) throws Exception;
	
	public void deleteTeacher(TeacherMaster teacherMaster) throws Exception;
	
}
