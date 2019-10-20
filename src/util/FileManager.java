package util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileManager {
	/**
     * 获取某个文件夹下的所有文件
     *
     * @param fileNameList 存放文件名称的list
     * @param path 文件夹的路径
     * @return
     */
    public static List<File> getAllDirectory(String path) {
        boolean flag = false;
        File file = new File(path);
        File[] tempList = file.listFiles();
        List<File> directory = new ArrayList<File>();

        for (int i = 0; i < tempList.length; i++) {
            if (tempList[i].isDirectory()) {
                directory.add(tempList[i]);
            }
        }
        
        return directory;
    }
}
