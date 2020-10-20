package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MovieAttachVO;

public interface MovieAttachMapper {
	public void insert(MovieAttachVO vo);
	
	public void delete(String uuid);
	
	public List<MovieAttachVO> findByMovTitle(String mov_title);
}
