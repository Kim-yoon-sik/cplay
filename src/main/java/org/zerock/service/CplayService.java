package org.zerock.service;

import java.util.List;

import org.zerock.domain.CCriteria;
import org.zerock.domain.MovieDAO;

public interface CplayService {
	
	public void register(MovieDAO cplay);
	
	public MovieDAO get(String title);
	
	public boolean modify(MovieDAO cplay);
	
	public boolean remove(String title);
	
	public List<MovieDAO> getList(CCriteria cri);

	public int getTotal(CCriteria cri);
	

}
