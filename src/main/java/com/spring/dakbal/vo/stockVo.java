package com.spring.dakbal.vo;

import java.sql.*;
//재고
public class stockVo {
	private int s_no;
	private String s_name;
	private String review;
	private int s_price;
	private int s_count;
	private Timestamp s_takedate;
	private String image;

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
