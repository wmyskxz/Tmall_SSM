import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.api.ShellCallback;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 逆向工程测试类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-上午 8:26
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:spring-mybatis.xml")
public class TestMybatisGenerator {

	public static void main(String[] args) throws Exception {
		// warnings 为用于放置生成过程中警告信息的集合对象
		List<String> warnings = new ArrayList<String>();
		// 指定是否覆盖重名文件
		boolean overwrite = true;
		// 加载配置文件
		File configFile = new File(MyBatisGenerator.class.getClassLoader().getResource("generatorConfig.xml").toURI());
		// 配置解析类
		ConfigurationParser cp = new ConfigurationParser(warnings);
		// 配置解析类解析配置文件并生成 Configuration 配置对象
		Configuration config = cp.parseConfiguration(configFile);
		// ShellCallback 负责如何处理重复文件
		ShellCallback callback = new DefaultShellCallback(overwrite);
		// 逆向工程对象
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		// 执行逆向文件生成操作
		myBatisGenerator.generate(null);
		// 打印提示信息
		System.out.println("MyBatis 逆向工程执行成功，刷新项目查看文件！");
	}

//	@Autowired
//	CategoryMapper categoryMapper;
//
//	@Test
//	public void test() {
//		Category category = new Category();
//		category.setName("分类1");
//		categoryMapper.insert(category);
//	}


}

