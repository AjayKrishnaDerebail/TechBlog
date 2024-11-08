package com.techblog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

public class ProfileImageUploadHelper {

  public static void deleteFile(String path) {

    File file = new File(path);
    file.delete();
  }

  public static void saveFile(InputStream is, String path, PrintWriter out) {
    try {
      byte[] b = new byte[is.available()];
      is.read(b);
      try (FileOutputStream fos = new FileOutputStream(path)) {
        fos.write(b);
        fos.flush();
        out.println("Profile image uploaded successfully");
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
}