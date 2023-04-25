package com.spring.dakbal.vo;


//결산
public class settlement {
	public int getStoc_no() {
		return stoc_no;
	}
	public void setStoc_no(int stoc_no) {
		this.stoc_no = stoc_no;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public int getTotal_sales() {
		return total_sales;
	}
	public void setTotal_sales(int total_sales) {
		this.total_sales = total_sales;
	}
	public int getNet_proceeds() {
		return net_proceeds;
	}
	public void setNet_proceeds(int net_proceeds) {
		this.net_proceeds = net_proceeds;
	}
	private int stoc_no; 		// 제품번호
	private String cus_id; 		// 고객 id
	private int profit; 		// 총판매 금액
	private int total_sales; 	// 총 판매수량
	private int net_proceeds;	// 순수익

}
