package org.zerock.domain;

import lombok.Data;

@Data
public class MovieAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	
	private String mov_title; //movieDAO에 있는 mov_title과 같아야 한다.
}
