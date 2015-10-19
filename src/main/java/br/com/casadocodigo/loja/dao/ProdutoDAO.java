package br.com.casadocodigo.loja.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

@Repository
public class ProdutoDAO {

	@PersistenceContext
	private EntityManager manager;

	public void save(Product product){
		
		manager.persist(product);
		
	}
	public List<Product> list(){
		
		return this.manager.createQuery("SELECT distinct(p) from Product p join fetch p.prices ").getResultList();
	}
	public Boolean existsTitle(Product product) {
		// TODO Auto-generated method stub
		Query query = manager.createQuery("select p from Product p where p.title = :title ");
		query.setParameter("title", product.getTitle());
		return ! query.getResultList().isEmpty();
		
		
	}
	public Product find(Integer id) {
		
		return manager.createQuery("select distinct(p) from Product p join fetch p.prices where p.id = :id", Product.class).setParameter("id", id).getSingleResult();
		
	}
	
}
