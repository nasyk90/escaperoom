package kr.co.roomescape.product.dto;

public class BaesongDto {

	private int id;
	private String name,zip,juso,juso_etc,phone,bae_msg,writeday;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public String getJuso_etc() {
		return juso_etc;
	}
	public void setJuso_etc(String juso_etc) {
		this.juso_etc = juso_etc;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBae_msg() {
		return bae_msg;
	}
	public void setBae_msg(String bae_msg) {
		this.bae_msg = bae_msg;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
