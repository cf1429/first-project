package com.using.cms.util;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.xwpf.converter.core.BasicURIResolver;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.w3c.dom.Document;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.List;

public class UtilsWord {

    static String path = UtilsFile.getUrl();

    public static String toHtml(String filepath){
        if (filepath.indexOf(".") >= 0) {
            String fileType = filepath.substring(filepath.lastIndexOf(".") + 1, filepath.length());
            if (fileType.equalsIgnoreCase("doc")) {
                try {
                    return docToHtml(filepath);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (fileType.equalsIgnoreCase("docx")) {
                try {
                    return docxToHtml(filepath);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return "";

    }
    /**
     * word07版本(.docx)转html
     * poi:word07在线预览
     * */
    public static String docxToHtml(String filepath) throws IOException {
        File f = new File(filepath);
        if (!f.exists()) {
            System.out.println("Sorry File does not Exists!");
        } else {
            if (f.getName().endsWith(".docx") || f.getName().endsWith(".DOCX")) {
                //读取文档内容
                InputStream in = new FileInputStream(f);
                XWPFDocument document = new XWPFDocument(in);

                File imageFolderFile = new File(path);
                //加载html页面时图片路径
                XHTMLOptions options = XHTMLOptions.create().URIResolver(new BasicURIResolver("./"));
                //图片保存文件夹路径
                options.setExtractor(new FileImageExtractor(imageFolderFile));
                OutputStream out = new FileOutputStream(new File(path+"/templ.html"));
                XHTMLConverter.getInstance().convert(document, out, options);
                out.close();
                System.out.println(path);
                return  readFile(path+"/templ.html");
            } else {
                System.out.println("Enter only MS Office 2007+ files");
            }


        }
        return "";
    }



    /**
     * word03版本(.doc)转html
     * poi:word03在线预览
     * */
    public static String  docToHtml(String filepath) {
        try {
            InputStream input = new FileInputStream(filepath);
            HWPFDocument wordDocument = new HWPFDocument(input);
            WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(
                    DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
            wordToHtmlConverter.setPicturesManager(new PicturesManager() {
                public String savePicture(byte[] content, PictureType pictureType,
                                          String suggestedName, float widthInches, float heightInches) {     //图片在html页面加载路径
                    return "image\\";
                }
            });
            wordToHtmlConverter.processDocument(wordDocument);
            //获取文档中所有图片
            List pics = wordDocument.getPicturesTable().getAllPictures();
            if (pics != null) {
                for (int i = 0; i < pics.size(); i++) {
                    Picture pic = (Picture) pics.get(i);
                    try {//图片保存在文件夹的路径
                        pic.writeImageContent(new FileOutputStream(path
                                + pic.suggestFullFileName()));
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    }
                }
            }
            //创建html页面并将文档中内容写入页面
            Document htmlDocument = wordToHtmlConverter.getDocument();
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            DOMSource domSource = new DOMSource(htmlDocument);
            StreamResult streamResult = new StreamResult(outStream);
            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer serializer = tf.newTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
            serializer.setOutputProperty(OutputKeys.INDENT, "yes");
            serializer.setOutputProperty(OutputKeys.METHOD, "html");
            serializer.transform(domSource, streamResult);
            outStream.close();
            String content = new String(outStream.toString("UTF-8"));
            FileUtils.writeStringToFile(new File(path, "templ.html"), content, "utf-8");
            return  readFile(path+"/templ.html");
        }catch (Exception e){

        }
        return "";
    }

    public static String readFile(String path){
        // 读
        File file = new File(path);
        FileWriter out = null;
        try {

            FileReader in = new FileReader(file);
            BufferedReader bufIn = new BufferedReader(in);
            // 内存流, 作为临时流
            CharArrayWriter  tempStream = new CharArrayWriter();
            // 替换
            String line = null;
            StringBuffer sb=new StringBuffer();
            while ( (line = bufIn.readLine()) != null) {
                // 替换每行中, 符合条件的字符串
                line = line.replaceAll("<body>", "");
                line = line.replaceAll("</body>", "");
                line = line.replaceAll("<html(.*?)>", "");
                line = line.replaceAll("</html>", "");
//				line = line.replaceAll("&times;", "x");
//				line = line.replaceAll("&hellip;", "...");
//				font-family:'  '
//				^123.*abc$
//				font-family:\"(.*?)\"
                line=line.replaceAll("font-family:'(.*?)'","font-family:FangSong_GB2312");
                line=line.replaceAll("<body(.*?)>","");
                // 将该行写入内存
                tempStream.write(line);
                // 添加换行符
                tempStream.append(System.getProperty("line.separator"));
                sb.append(line);
            }
            System.out.println(line);
            // 关闭 输入流
            bufIn.close();
            // 将内存中的流 写入 文件
            out = new FileWriter(file);
            tempStream.writeTo(out);
            out.close();
            boolean delete = file.delete();
            System.out.println("删除文件"+delete);
            System.out.println(sb.toString());
            return StringEscapeUtils.unescapeHtml(sb.toString());
//			return sb.toString();
        }catch (Exception e){
            e.printStackTrace();
            if(out != null){
                try {
                    out.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
        return "";

    }


    public static void main(String[] args) {
        String s = UtilsWord.toHtml("E:\\凡预\\官网\\test\\知仲官网系统接口文档V1.0.0.docx");
        System.out.println(s);
    }
}
