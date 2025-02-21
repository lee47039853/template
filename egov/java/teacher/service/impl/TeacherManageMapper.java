package kr.or.ifac.modules.portal.teacher.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ifac.modules.portal.teacher.service.TeacherMaster;
import kr.or.ifac.modules.portal.teacher.service.TeacherMasterVO;

/**
 * 강사 관리를 위한 MyBatis Mapper 인터페이스
 */
@Mapper
public interface TeacherManageMapper {
	
    List<TeacherMasterVO> selectTeacherList(@Param("vo") TeacherMasterVO vo) throws Exception;

    int selectTeacherListCnt(@Param("vo") TeacherMasterVO vo) throws Exception;
    
    TeacherMasterVO selectTeacher(@Param("vo") TeacherMasterVO vo) throws Exception;
    
    void updateTeacher(@Param("teacherMaster") TeacherMaster teacherMaster) throws Exception;
    
    void insertTeacher(@Param("teacherMaster") TeacherMaster teacherMaster) throws Exception;
    
    void deleteTeacher(@Param("teacherMaster") TeacherMaster teacherMaster) throws Exception;
}