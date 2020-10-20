package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberDAO {
	private String mem_id; 
	private String mem_pw; 
	private String mem_name; 
	private String mem_birth; 
	private String mem_email; 
	private String mem_phone; 
	private String mem_gender; 
	private String mem_oaddress; 
	private String mem_address; 
	private String mem_detailaddress;
	private Date mem_regdate;
	private Date mem_updatedate;
	
	private char enabled;
	private List<AuthVO> authList;
}
