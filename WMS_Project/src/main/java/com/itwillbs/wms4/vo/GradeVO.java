package com.itwillbs.wms4.vo;

public class GradeVO {
//	CREATE TABLE grade (
//			GRADE_CD VARCHAR(10) NOT NULL,
//			GRADE_NAME VARCHAR(50) NOT NULL
//		);
	
	private String grade_cd;
	private String grade_name;
	
	public GradeVO() {
		super();
	}

	public GradeVO(String grade_cd, String grade_name) {
		super();
		this.grade_cd = grade_cd;
		this.grade_name = grade_name;
	}

	public String getGrade_cd() {
		return grade_cd;
	}

	public void setGrade_cd(String grade_cd) {
		this.grade_cd = grade_cd;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	@Override
	public String toString() {
		return "GradeVO [grade_cd=" + grade_cd + ", grade_name=" + grade_name + "]";
	}
	
	
}
