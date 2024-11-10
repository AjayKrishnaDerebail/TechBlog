package com.techblog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ProfileImageUploadHelper {

  public static void deleteFile(String path) {

    File file = new File(path);
    file.delete();
  }

  public static void saveFile(InputStream is, String path) {
    try {
      byte[] b = new byte[is.available()];
      int r = is.read(b);
      if (r > 0) {
        try (FileOutputStream fos = new FileOutputStream(path)) {
          fos.write(b);
          fos.flush();
          System.out.println("Profile image uploaded successfully");
        }
      }else{
        System.out.println("No file uploaded");
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
}