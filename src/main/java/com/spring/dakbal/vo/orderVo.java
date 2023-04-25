package com.spring.dakbal.vo;

import java.sql.Timestamp;
//주문목록
public class orderVo {
	private int o_no;
	private String me_id;
	private int state_code;
	private int stc_no;
	private int o_count;
	private int totalPrice;
	
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	private Timestamp o_date;
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getM_id() {
		return me_id;
	}
	public void setM_id(String me_id) {
		this.me_id = me_id;
	}
	public int getState_code() {
		return state_code;
	}
	public void setState_code(int state_code) {
		this.state_code = state_code;
	}
	public int getStc_no() {
		return stc_no;
	}
	public void setStc_no(int stc_no) {
		this.stc_no = stc_no;
	}
	public int getO_count() {
		return o_count;
	}
	public void setO_count(int o_count) {
		this.o_count = o_count;
	}
	public Timestamp getO_date() {
		return o_date;
	}
	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}
}
