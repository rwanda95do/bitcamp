package com.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {
	//추상메서드  object -throwabl-exception
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
	
}
