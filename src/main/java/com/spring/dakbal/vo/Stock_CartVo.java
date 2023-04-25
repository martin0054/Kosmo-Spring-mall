package com.spring.dakbal.vo;

import java.sql.*;

public class Stock_CartVo {
	//stock
	private int s_no;		//상품 번호
	private String s_name;	//상품명
	private String review;	//소개
	private int s_price;	//가격
	private int s_count;	//입고량
	private Timestamp s_takedate;	//입고일
	private String image;	//사진
	
	//cart
	private int c_no;		//장바구니 번호
	private int st_no; 		//상품 번호
	private String m_id;	//고객 id
	private int c_count;	//장바구니 수량 
	private int validity;	//유효점
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public int getValidity() {
		return validity;
	}
	public void setValidity(int validity) {
		this.validity = validity;
	}
	
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
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
}
