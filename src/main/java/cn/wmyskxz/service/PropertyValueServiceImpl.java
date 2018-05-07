package cn.wmyskxz.service;

import cn.wmyskxz.mapper.PropertyValueMapper;
import cn.wmyskxz.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * cn.wmyskxz.pojo.PropertyValueValueService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-28-上午 7:47
 */
@Service
public class PropertyValueServiceImpl implements PropertyValueService {

	@Autowired
	PropertyValueMapper propertyValueMapper;

	@Autowired
	PropertyService propertyService;

	@Autowired
	ProductService productService;

	public void add(PropertyValue propertyValue) {
		propertyValueMapper.insert(propertyValue);
	}

	public void delete(Integer id) {
		propertyValueMapper.deleteByPrimaryKey(id);
	}

	public void deleteByProductId(Integer product_id) {
		// 按条件查询出需要删除的列表
		PropertyValueExample example = new PropertyValueExample();
		example.or().andProduct_idEqualTo(product_id);
		Integer category_id = productService.get(product_id).getCategory_id();
		List<PropertyValue> propertyValues = list(product_id, category_id);
		// 循环删除
		for (int i = 0; i < propertyValues.size(); i++) {
			propertyValueMapper.deleteByPrimaryKey(propertyValues.get(i).getId());
		}
	}

	public void update(PropertyValue propertyValue) {
		propertyValueMapper.updateByPrimaryKey(propertyValue);
	}

	public List<PropertyValue> list(Integer product_id, Integer category_id) {
		PropertyValueExample example = new PropertyValueExample();
		List<PropertyValue> propertyValues = new ArrayList<>();
		List<Property> properties = propertyService.list(category_id);
		for (Property property : properties) {
			// 筛选出同时匹配 property_id 和 product_id 的值
			example.or().andProperty_idEqualTo(property.getId()).andProduct_idEqualTo(product_id);
			propertyValues.addAll(propertyValueMapper.selectByExample(example));
		}
		return propertyValues;
	}

	public PropertyValue get(Integer id) {
		return propertyValueMapper.selectByPrimaryKey(id);
	}

	public List<PropertyValue> listByProductId(Integer product_id) {
		PropertyValueExample example = new PropertyValueExample();
		example.or().andProduct_idEqualTo(product_id);
		List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(example);
		for (PropertyValue propertyValue : propertyValues) {
			Property property = propertyService.get(propertyValue.getProperty_id());
			propertyValue.setProperty(property);
		}
		return propertyValues;
	}
}
