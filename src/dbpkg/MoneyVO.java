package dbpkg;
//custno  number(6),
//salenol number(8) primary key not null,
//pcost   number(8),
//amount  number(4),
//price   number(8),
//pcode   varchar2(4),
//sdate   date

public class MoneyVO {
	private int custno;
	private int salenol;
	private int pcost;
	private int amount;
	private int price;
	private int pcode;
	private int sdate;
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public int getSalenol() {
		return salenol;
	}
	public void setSalenol(int salenol) {
		this.salenol = salenol;
	}
	public int getPcost() {
		return pcost;
	}
	public void setPcost(int pcost) {
		this.pcost = pcost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public int getSdate() {
		return sdate;
	}
	public void setSdate(int sdate) {
		this.sdate = sdate;
	}
	
	
}
