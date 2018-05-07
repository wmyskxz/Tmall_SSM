package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.Property;
import cn.wmyskxz.service.CategoryService;
import cn.wmyskxz.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Property 控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 19:00
 */
@Controller
@RequestMapping("/admin")
public class PropertyController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	PropertyService propertyService;

	@RequestMapping("/listProperty")
	public String list(Model model, Integer category_id) {
		List<Property> properties = propertyService.list(category_id);
		model.addAttribute("properties", properties);
		Category category = categoryService.get(category_id);
		model.addAttribute("category", category);
		return "admin/listProperty";
	}

	@RequestMapping("/addProperty")
	public String add(Property property) {
		propertyService.add(property);
		return "redirect:listProperty?category_id=" + property.getCategory_id();
	}

	@RequestMapping("/deleteProperty")
	public String delete(Integer id) {
		int category_id = propertyService.get(id).getCategory_id();
		propertyService.delete(id);
		return "redirect:listProperty?category_id=" + category_id;
	}

	@RequestMapping("/editProperty")
	public String edit(Integer id, Model model) {
		Property property = propertyService.get(id);
		model.addAttribute("property", property);
		Category category = categoryService.get(property.getCategory_id());
		model.addAttribute("category", category);
		return "admin/editProperty";
	}

	@RequestMapping("/updateProperty")
	public String update(Property property) {
		propertyService.update(property);
		return "redirect:listProperty?category_id=" + property.getCategory_id();
	}
}
