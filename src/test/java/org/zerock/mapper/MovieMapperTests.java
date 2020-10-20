package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.MovieDAO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MovieMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MovieMapper mapper;
	
	@Test
	public void testInsert() {
		MovieDAO movie = new MovieDAO();
		movie.setMov_title("영화 타이틀");
		movie.setMov_thumbnail("영화 썸네일");
		movie.setMov_genre("영화 장르");
		movie.setMov_director("영화 감독");
		movie.setMov_actor("영화 배우");
		movie.setMov_nation("영화 출시국");
		movie.setMov_opday("영화 개봉일");
		movie.setMov_running_time("영화 상영 시간");
		movie.setMov_point("영화 평점");
		movie.setMov_platform("영화 상영 플랫폼");
		movie.setMov_detailImg("영화 상세 이미지");
		movie.setMov_clip("영화 예고편");
		
		mapper.insertMovie(movie);
		
		log.info(movie);
	}
}
