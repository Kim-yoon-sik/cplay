package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CCriteria;
import org.zerock.domain.MovieDAO;
import org.zerock.mapper.CplayMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CplayServiceImpl implements CplayService {
	
	@Setter(onMethod_ = @Autowired)
	private CplayMapper mapper;

	@Override
	public void register(MovieDAO cplay) {
		log.info("register......." + cplay);
		 mapper.insert(cplay);
	}

	@Override
	public MovieDAO get(String title) {
		log.info("get.........." + title);
		return mapper.read(title);
	}
	
	public boolean modify(MovieDAO cplay) {
		log.info("modify......." + cplay);
		return mapper.update(cplay) == 1;
	}
	
	public boolean remove(String title) {
		log.info("remove....." + title);
		return mapper.delete(title) == 1;
	}

	@Override
	public List<MovieDAO> getList(CCriteria cri) {
		log.info("get List with ccriteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(CCriteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
}
