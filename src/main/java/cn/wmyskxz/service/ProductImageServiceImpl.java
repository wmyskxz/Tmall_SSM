package cn.wmyskxz.service;

import cn.wmyskxz.mapper.ProductImageMapper;
import cn.wmyskxz.pojo.ProductImage;
import cn.wmyskxz.pojo.ProductImageExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProductImageService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-28-上午 11:04
 */
@Service
public class ProductImageServiceImpl implements ProductImageService {

	@Autowired
	ProductImageMapper productImageMapper;

	public void add(ProductImage image) {
		productImageMapper.insert(image);
	}

	public void deleteByProductId(Integer product_id) {

		// 按条件查询出需要删除的列表
		ProductImageExample example = new ProductImageExample();
		example.or().andProduct_idEqualTo(product_id);
		List<ProductImage> productImages = list(product_id);

		// 循环删除
		for (int i = 0; i < productImages.size(); i++) {
			productImageMapper.deleteByPrimaryKey(productImages.get(i).getId());
		}
	}

	public void update(ProductImage image) {
		productImageMapper.updateByPrimaryKey(image);
	}

	public ProductImage get(Integer id) {
		return productImageMapper.selectByPrimaryKey(id);
	}

	public List<ProductImage> list(Integer product_id) {
		ProductImageExample example = new ProductImageExample();
		example.or().andProduct_idEqualTo(product_id);
		List<ProductImage> productImages = productImageMapper.selectByExample(example);
		return productImages;
	}
}
