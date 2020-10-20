package org.zerock.mapper;

import org.zerock.domain.MovieDAO;

public interface MovieMapper {
	public void insertMovie(MovieDAO movie); //영화 정보 저장(관리자전용)
	
	public int deleteMovie(String mov_title); //영화정보 삭제 (관리자 전용)
	
	public int updateMovie(MovieDAO movieInfo); // 영화정보 수정 (관리자 전용)
}
