package visitors;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

public class Count {
	
	// 识别系统
	private static boolean isOSLinux() {
        Properties prop = System.getProperties();
        String os = prop.getProperty("os.name");
        if (os != null && os.toLowerCase().indexOf("linux") > -1) {
            return true;
        } else {
            return false;
        }
    }
	
	// 该方法用于实验二读取文件
	public static String readAndSaveTraffic(){
		File file;
		if(isOSLinux()) {
			file = new File("/usr/java/tomcat/apache-tomcat-8.5.46/webapps/MyJspProject", "traffic.txt");	
		}else {
			file = new File("E:/workspace/EclipseWorkspace/MyJspProject", "traffic.txt");
		}
		if(!file.exists()){
			try {  
			    file.createNewFile(); // 创建文件  
			    writeTrafficToFile(0, file);
			} catch (IOException e) {  
			    // TODO Auto-generated catch block  
			    e.printStackTrace();  
			}  
		}   
	        
		int traffic = readTrafficFromFile(file);
		traffic ++;
		writeTrafficToFile(traffic, file);
		return traffic+"";
	}
	
	// 向文件写入内容(输出流)  
	private static boolean writeTrafficToFile(int traffic, File file) {
		String str = traffic + "";  
		byte bt[] = new byte[1024];  
		bt = str.getBytes();  
		try {  
		    FileOutputStream in = new FileOutputStream(file);  
		    try {  
		        in.write(bt, 0, bt.length);  
		        in.close();  
		        // boolean success=true;  
		        // System.out.println("写入文件成功");  
		    } catch (IOException e) {  
		        // TODO Auto-generated catch block  
		        e.printStackTrace();  
		    }  
		} catch (FileNotFoundException e) {  
		    // TODO Auto-generated catch block  
		    e.printStackTrace();  
		}  
		return true;
	}
	
	// 读取文件内容 (输入流)
	private static int readTrafficFromFile(File file) {
		StringBuffer sb = new StringBuffer();
		try {    
		    FileInputStream out = new FileInputStream(file);  
		    InputStreamReader isr = new InputStreamReader(out);  
		    int ch = 0;  
		    while ((ch = isr.read()) != -1) {  
		        sb.append((char) ch);  
		    }  
		} catch (Exception e) {  
		    // TODO: handle exception  
		} 
		return Integer.parseInt(sb.toString());
	}
}
