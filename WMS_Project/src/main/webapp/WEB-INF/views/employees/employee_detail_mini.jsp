<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/employee_detail_mini.css" />
  </head>
  <body>
	${employees.photo }<br>
	${employees.emp_name }<br>
	${employees.emp_email }<br>
	${employees.emp_num }<br>
	부서코드: ${employees.dept_cd }<br>
	직급코드: ${employees.grade_cd }<br>
	연락처: ${employees.emp_dtel }<br>(사무실)<br>
	입사일: ${employees.hire_date }<br>
	재직여부: ${employees.work_cd }<br>
	권한: ${employees.priv_cd }
  </body>
</html>