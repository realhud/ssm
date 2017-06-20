package com.naaru.core.base.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContext;

/**
 * Controller 层父类支持对象 
 * @author huangdi
 *
 */
public class BaseController {
	protected Logger logger = Logger.getLogger(this.getClass());
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}
	
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	
	public String getMessage(String key) {
		RequestContext requestContext = new RequestContext(getRequest());
		return requestContext.getMessage(key);
	}
	
	public static void logBefore(Logger logger, String interfaceName) {
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger) {
		logger.info("end");
	}
	
}
