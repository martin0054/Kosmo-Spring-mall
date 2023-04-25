
package com.spring.dakbal.vo;


public class cartVo {
	private int c_no;	// 장바구니 번호
	private String m_id;	// 고객 id
	private int st_no; 	// 상품 번호
	private int c_count;//장바구니 수량 


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



}
