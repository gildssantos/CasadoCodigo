package br.com.casadocodigo.loja.conf;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMVC extends
		AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[] { SecurityConfiguration.class,
				AppWebConfiguration.class, JPAConfiguration.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {

		return new Class[] {};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] { "/" };
	}

	@Override
	protected void customizeRegistration(Dynamic registration) {
		// TODO Auto-generated method stub
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}

}