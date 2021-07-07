package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.WalkCourseService;

/** 코스목록 데이터 관리 기능을 제공하기 위한 Service계층에 대한 구현체 */
@Slf4j
@Service
public class WalkCourseServiceImpl implements WalkCourseService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 코스 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<WalkCourse> getWalkCourseList(WalkCourse input) throws Exception {
		List<WalkCourse> result = null;

		try {
			result = sqlSession.selectList("WalkCourseMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * [페이지네이션에 필요] 데이터가 저장되어있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getWalkCourseCount(WalkCourse input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("WalkCourseMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
