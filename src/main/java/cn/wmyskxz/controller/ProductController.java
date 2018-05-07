package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.Product;
import cn.wmyskxz.pojo.ProductImage;
import cn.wmyskxz.service.CategoryService;
import cn.wmyskxz.service.ProductImageService;
import cn.wmyskxz.service.ProductService;
import cn.wmyskxz.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * Product 控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 20:21
 */
@Controller
@RequestMapping("/admin")
public class ProductController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService productService;

	@Autowired
	ProductImageService productImageService;

	@Autowired
	PropertyValueService propertyValueService;

	@RequestMapping("/listProduct")
	public String list(Model model, Integer category_id) {
		List<Product> products = productService.list(category_id);
		model.addAttribute("products", products);
		Category category = categoryService.get(category_id);
		model.addAttribute("category", category);
		return "admin/listProduct";
	}

	@RequestMapping("/addProduct")
	public String add(Product product) {
		productService.add(product);

		// 创建新的 Product 时默认创建 5 个对应的 ProductImage 数据
		ProductImage productImage = new ProductImage();
		productImage.setProduct_id(product.getId());
		for (int i = 1; i <= 5; i++) {
			productImageService.add(productImage);
		}

		return "redirect:listProduct?category_id=" + product.getCategory_id();
	}

	@RequestMapping("/deleteProduct")
	public String delete(Integer id, HttpServletRequest request) {

		// 在删除产品的时候将对应的 5 个 ProductImage 数据也删除了
		productImageService.deleteByProductId(id);
		// 同时删除目录下的相关文件
		String path = request.getSession().getServletContext().getRealPath("" + id);
		deleteDir(new File(path));

		// 删除外键对应的数据
		propertyValueService.deleteByProductId(id);

		int category_id = productService.get(id).getCategory_id();
		productService.delete(id);

		return "redirect:listProduct?category_id=" + category_id;
	}

	/**
	 * 递归删除目录下的所有文件及子目录下所有文件
	 *
	 * @param dir 将要删除的文件目录
	 * @return boolean Returns "true" if all deletions were successful.
	 * If a deletion fails, the method stops attempting to
	 * delete and returns "false".
	 */
	private static boolean deleteDir(File dir) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			//递归删除目录中的子目录下
			for (int i = 0; i < children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}
		// 目录此时为空，可以删除
		return dir.delete();
	}

	@RequestMapping("/editProduct")
	public String edit(Integer id, Model model) {
		Product product = productService.get(id);
		model.addAttribute("product", product);
		Category category = categoryService.get(product.getCategory_id());
		model.addAttribute("category", category);
		return "admin/editProduct";
	}

	@RequestMapping("/updateProduct")
	public String update(Product product) {
		productService.update(product);
		return "redirect:listProduct?category_id=" + product.getCategory_id();
	}
}
