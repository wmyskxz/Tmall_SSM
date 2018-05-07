package cn.wmyskxz.service;

import cn.wmyskxz.mapper.ProductMapper;
import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.Product;
import cn.wmyskxz.pojo.ProductExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ProductService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 20:16
 */
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;

	@Autowired
	ReviewService reviewService;

	@Override
	public void add(Product product) {
		productMapper.insert(product);
	}

	@Override
	public void delete(Integer id) {
		productMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void update(Product product) {
		productMapper.updateByPrimaryKey(product);
	}

	@Override
	public Product get(Integer id) {
		return productMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Product> list(Integer category_id) {
		ProductExample example = new ProductExample();
		example.or().andCategory_idEqualTo(category_id);
		List<Product> products = productMapper.selectByExample(example);
		return products;
	}

	@Override
	public void fill(List<Category> categories) {
		for (Category category : categories) {
			fill(category);
		}
	}

	@Override
	public void fill(Category category) {
		List<Product> products = list(category.getId());
		category.setProducts(products);
	}

	@Override
	public void fillByRow(List<Category> categories) {
		int productNumberOfEachRow = 8;
		for (Category category : categories) {
			List<Product> products = category.getProducts();
			List<List<Product>> productByRow = new ArrayList<>();
			for (int i = 0; i < products.size(); i += productNumberOfEachRow) {
				int size = i + productNumberOfEachRow;
				size = size > products.size() ? products.size() : size;
				List<Product> productsOfEachRow = products.subList(i, size);
				productByRow.add(productsOfEachRow);
			}
			category.setProductByRow(productByRow);
		}
	}

	@Override
	public void setReviewCount(Product product) {
		int reviewCount = reviewService.getCount(product.getId());
		product.setReviewCount(reviewCount);
	}

	@Override
	public List<Product> search(String keyword) {
		ProductExample example = new ProductExample();
		example.or().andNameLike("%" + keyword + "%");
		example.setOrderByClause("id desc");
		return productMapper.selectByExample(example);
	}
}
