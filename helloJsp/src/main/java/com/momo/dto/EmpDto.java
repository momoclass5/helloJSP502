package com.momo.dto;

public class EmpDto {
	private String emp_id;
	private String emp_name;
	private String emp_no;
	
	@Override
	public String toString() {
		return emp_id + "/" + emp_name + "/" + emp_no;
	}
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	
}
