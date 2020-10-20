package org.zerock.service;

import org.zerock.domain.MovieDAO;

public interface MovieAdminService {
	public void insertMovieInfo(MovieDAO movie); // 영화 정보 등록
	
	public boolean removeMovieInfo(String mov_title); //영화 정보 삭제
	
	public boolean updateMovieInfo(MovieDAO movie);
}
