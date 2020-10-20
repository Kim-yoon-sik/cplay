package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class MovieDAO {
	private String mov_title;
	private String mov_thumbnail;
	private String mov_genre;
	private String mov_director;
	private String mov_actor;
	private String mov_nation;
	private String mov_opday;
	private String mov_running_time;
	private String mov_point;
	private String mov_platform;
	private String mov_detailImg;
	private String mov_clip;
	
	private boolean mov_image; //이미지 여부 파악
	
	private List<MovieAttachVO> attachList; //첨부파일
	
	// 14개 항목
}
