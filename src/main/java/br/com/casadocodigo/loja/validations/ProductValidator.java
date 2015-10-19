package br.com.casadocodigo.loja.validations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.Product;

@Component
public class ProductValidator implements Validator {

	@Autowired
	private ProdutoDAO productDao;

	@Override
	public boolean supports(Class<?> classe) {
		// TODO Auto-generated method stub
		return Product.class.isAssignableFrom(classe);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		Product product = (Product) target;
		
		if (productDao.existsTitle(product)){
			
			errors.rejectValue("title","title.unique");
			
		}
		
	}
	
}
