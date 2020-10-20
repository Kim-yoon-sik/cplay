package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.CCriteria;
import org.zerock.domain.MovieDAO;

public interface CplayMapper {
	
public List<MovieDAO> getList();

public List<MovieDAO> getListWithPaging(CCriteria cri);

public void insert(MovieDAO cplay);

public Integer insertSelectKey(MovieDAO cplay);

public MovieDAO read(String title);

public int delete(String title); //해당하는 영화정보를 삭제

public int update(MovieDAO cplay);

public int getTotalCount(CCriteria cri);

}
