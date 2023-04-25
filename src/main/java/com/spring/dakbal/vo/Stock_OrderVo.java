package com.spring.dakbal.vo;

import java.sql.*;

public class Stock_OrderVo {
	//stock
private String s_name;				//상품명
	private String review;			//소개
	private int s_price;			//가격
	private int s_count;			//입고량
	private Timestamp s_takedate;	//입고일
	private String image;			//사진
	
	//order
	private String me_id;		//고객 id
	private int state_code;		//상태코드
	private int stc_no;			//상품 번호
	private int o_count;		//주문수량
	private Timestamp o_date;	//주문일
	private int totalPrice;		//수량 * 가격 
	
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public Timestamp getS_takedate() {
		return s_takedate;
	}
	public void setS_takedate(Timestamp s_takedate) {
		this.s_takedate = s_takedate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getMe_id() {
		return me_id;
	}
	public void setMe_id(String me_id) {
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
	private int o_no;			//주문 번호
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
