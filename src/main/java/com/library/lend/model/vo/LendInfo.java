package com.library.lend.model.vo;

import java.sql.Date;

public class LendInfo {
	private String memberId;
	private int book_no;
	private Date lend_date; // 대출 일자 SYSDATE
	private Date return_date; // 대출 일자 SYSDATE+7
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public Date getLend_date() {
		return lend_date;
	}
	public void setLend_date(Date lend_date) {
		this.lend_date = lend_date;
	}
	public Date getReturn_date() {
		return return_date;
	}
	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}
	
}
