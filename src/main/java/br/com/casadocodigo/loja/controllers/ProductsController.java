package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.validations.ProductValidator;

@RequestMapping("/products")
@Controller
public class ProductsController {

	@Autowired
	private ProdutoDAO productDAO;

	@Autowired
	private ProductValidator validator;
	
	@Autowired
	private FileSaver fileSaver;

	@RequestMapping("/form")
	public ModelAndView form(@ModelAttribute Product product) {

		ModelAndView modelAndView = new ModelAndView("products/form");

		modelAndView.addObject("types", BookType.values());

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	@Transactional
	public ModelAndView save(@Valid Product product,
			BindingResult bindingResult, RedirectAttributes redirectAttributes,
			MultipartFile summary) {

		if (bindingResult.hasErrors()) {
			return form(product);

		}
		
		String webPath = fileSaver.write("uploaded-summaries",summary);
		product.setSummaryPath(webPath);
		
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("Sucesso",
				"Produto cadastro com sucesso !");
		return new ModelAndView("redirect:/products");
	}

	@RequestMapping(method = RequestMethod.GET)
	@Transactional
	@Cacheable(value="lastProducts")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("/products/list");
		mv.addObject("products", productDAO.list());
		return mv;

	}

	@InitBinder
	public void addValidators(WebDataBinder binder) {
		binder.addValidators(validator);

	}
	
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	public ModelAndView show(@PathVariable("id")Integer id){
		
		 ModelAndView modelAndView = new ModelAndView("products/show");
		 modelAndView.addObject("product", productDAO.find(id));
		 return modelAndView;
		
	}

	@ResponseBody
	@RequestMapping("/json")
	public List<Product> listJson(){
		return productDAO.list();
	}
	
	/*@RequestMapping(method=RequestMethod.DELETE, value="/{id}")
	public ModelAndView delete(@PathVariable("id")Integer id){
		
		 ModelAndView modelAndView = new ModelAndView("products/");
		 modelAndView.addObject("product", productDAO.delete(id));
		 return modelAndView;
		
	}*/

}
