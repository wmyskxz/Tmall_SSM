package cn.wmyskxz.service;

import cn.wmyskxz.pojo.ProductImage;

import java.util.List;

public interface ProductImageService {

	void add(ProductImage image);

	void deleteByProductId(Integer product_id);

	void update(ProductImage image);

	ProductImage get(Integer id);

	List<ProductImage> list(Integer product_id);
}
