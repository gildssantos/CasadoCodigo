package br.com.casadocodigo.loja.controllers;

import java.math.BigDecimal;
import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.PaymentData;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.ShoppingItem;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartController {

	@Autowired
	private ProdutoDAO productDao;

	@Autowired
	private ShoppingCart shoppingCart;

	@Autowired
	private RestTemplate restTamplate;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView add(Integer productId, @RequestParam BookType bookType) {

		ShoppingItem item = createItem(productId, bookType);
		shoppingCart.add(item);
		return new ModelAndView("redirect:/products");

	}

	private ShoppingItem createItem(Integer productId, BookType bookType) {

		Product product = productDao.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);

		return item;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String items() {
		return "ShoppingCart/items";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public Callable<String> checkout() {
		return () -> {

			BigDecimal total = shoppingCart.getTotal();
			String uriTopay = "http://book-payment.herokuapp.com/payment";

			try {

				HttpHeaders hearders = new HttpHeaders();
				hearders.setContentType(MediaType.APPLICATION_JSON);
				HttpEntity<PaymentData> request = new HttpEntity<>(
						new PaymentData(total), hearders);

				String response = restTamplate.postForObject(uriTopay, request,
						String.class);

				System.out.println(response);
				return "redirect:/products";

			} catch (HttpClientErrorException exception) {

				System.out.println("Ocorreu um erro ao criar o Pagamento:"
						+ exception.getMessage());
				return "redirect:/shopping";

			}

		};

	}
}
