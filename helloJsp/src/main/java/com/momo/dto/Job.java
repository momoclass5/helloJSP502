package com.momo.dto;

public class Job {
	private String jobCode;
	private String jobName;
	
	@Override
	public String toString() {
		return jobCode + "/" +jobName;
	}
	
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
}
