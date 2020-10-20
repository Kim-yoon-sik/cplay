package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MovieDAO;
import org.zerock.mapper.MovieMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MovieAdminServiceImpl implements MovieAdminService{
	
	@Setter(onMethod_ = @Autowired)
	private MovieMapper mapper;
	
	@Override
	public void insertMovieInfo(MovieDAO movie) {
		log.info("영화 등록............." + movie);
		
		mapper.insertMovie(movie);
	}

	@Override
	public boolean removeMovieInfo(String mov_title) {
		log.info("remove....." + mov_title);
		return mapper.deleteMovie(mov_title) == 1;
	}

	@Override
	public boolean updateMovieInfo(MovieDAO movie) {
		log.info("update....." + movie);
		
		return mapper.updateMovie(movie) == 1; 
	}
}
