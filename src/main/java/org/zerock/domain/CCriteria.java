package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CCriteria {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public CCriteria() {
		this(1,100);
	}
	
	public CCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
}
