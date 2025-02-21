package kr.or.ifac.modules.portal.teacher.service.impl;

import java.util.List;

import kr.or.ifac.modules.portal.teacher.service.TeacherMaster;
import kr.or.ifac.modules.portal.teacher.service.TeacherMasterVO;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 강사 관리를 위한 MyBatis Mapper 인터페이스
 */
@Mapper("teacherManageMapper")
public interface TeacherManageMapper {
	
    List<TeacherMasterVO> selectTeacherList(TeacherMasterVO vo) throws Exception;

    int selectTeacherListCnt(TeacherMasterVO vo) throws Exception;
    
    TeacherMasterVO selectTeacher(TeacherMasterVO vo) throws Exception;
    
    void updateTeacher(TeacherMaster teacherMaster) throws Exception;
    
    void insertTeacher(TeacherMaster teacherMaster) throws Exception;
    
    void deleteTeacher(TeacherMaster teacherMaster) throws Exception;
}