package com.claimit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class ImageUploadUtil {

    private static final long MAX_FILE_SIZE = 100 * 1024 * 1024; //100 mb upload size acceptance criteria
    private static final List<String> ALLOWED_TYPES = Arrays.asList("image/png", "image/jpeg");

    public String getImageNameFromPart(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        String imageName = null;
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return (imageName == null || imageName.isEmpty())
                ? System.currentTimeMillis() + "_download.png"
                : System.currentTimeMillis() + "_" + imageName;
    }

    public boolean isValidImage(Part part) {
        String contentType = part.getContentType();
        return part.getSize() <= MAX_FILE_SIZE
                && contentType != null
                && ALLOWED_TYPES.contains(contentType);
    }

    // imageName is now passed in — computed once outside, not again here
    public boolean uploadImage(Part part, String rootPath, String saveFolder, String imageName) {
        String savePath = getSavePath(rootPath, saveFolder);
        File fileSaveDir = new File(savePath);

        if (!fileSaveDir.exists() && !fileSaveDir.mkdirs()) {
//            System.out.println("Failed to create directory: " + savePath);
            return false;
        }

        try {
            part.write(savePath + imageName);
//            System.out.println("Write success: " + savePath + imageName);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<String> uploadMultipleImages(HttpServletRequest request, String rootPath, String saveFolder)
            throws IOException, ServletException {

        List<String> uploadedFilePaths = new ArrayList<>();

        for (Part part : request.getParts()) {
            if (!part.getName().equals("item_image") || part.getSize() == 0) {
                continue;
            }

            if (!isValidImage(part)) {
//                System.out.println("Invalid image skipped: " + part.getSubmittedFileName());
                continue;
            }

            //  used for both writing file and storing in DB
            String imageName = getImageNameFromPart(part);

            if (uploadImage(part, rootPath, saveFolder, imageName)) {
                // storing relative path so that in JSP can be used directly with contextPath
            	uploadedFilePaths.add("uploads/" + saveFolder + "/" + imageName);
            }
        }

        return uploadedFilePaths;
    }

    public String getSavePath(String rootPath, String saveFolder) {
        return rootPath + "/" + saveFolder + "/";
    }
}