import org.junit.Test;

import java.io.*;

/**
 * 测试 File
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-28-下午 16:48
 */

public class FileTester {

	@Test
	public void test() {
		String newDir2 = "C:/test";
		deleteDir(new File(newDir2));
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

	@Test
	public void tester() {
		String filePath = "D:/test.txt";
		File readFile = new File(filePath);
		File writeFile = new File("D:/result.txt");
		BufferedReader reader = null;

		try {
			System.out.println("以行为单位读取文件内容，一次读一整行：");
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(readFile), "gbk"));
//			OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(writeFile), "gbk");
//			BufferedWriter writer = new BufferedWriter(write);
			FileWriter writer = new FileWriter("D:/result.txt", true);


			String tempString = null;
			int line = 1;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				System.out.println("line " + line + ": " + tempString);

				// 当判断为头部
				if (tempString.startsWith("-")) {
					// 开头
					tempString = tempString.substring(1);
					writer.write("    <div class=\"hot-word-line\">\r\n" +
							"        <div class=\"line-title\">\r\n");
					writer.write("            <div class=\"title-text\">" + tempString + "</div>\r\n" +
							"            <i>></i>\r\n" +
							"        </div>\r\n" +
							"        <div class=\"line-con\">\r\n");
				} else {
					// 结尾
					if (tempString.startsWith("*")) {
						writer.write("            <div class=\"seprate clearfix\"></div>\r\n" +
								"        </div>\r\n" +
								"    </div>\r\n");
					} else if (tempString.endsWith("=")) {
						// 中间的hot-word
						tempString = tempString.substring(0, tempString.length() - 1);
						writer.write("            <a class=\"hot-word  highlight\" href=\"/searchProduct?keyword=" + tempString + "\">" + tempString + "</a>\r\n");
					} else {
						writer.write("            <a class=\"hot-word \" href=\"/searchProduct?keyword=" + tempString + "\">" + tempString + "</a>\r\n");
					}
				}


				line++;
			}


			reader.close();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
	}
}