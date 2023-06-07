<%@page import="biz.campingcar.CampingcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
 
<%
	//이미지이므로 신규 파일로 디렉토리 설정 및 업로드   
	ServletContext context = getServletContext(); 
	
	String url = "images/detail"; // 파일을 저장할 URL 지정
	String path = context.getRealPath(url); // 실제로 서버에 저장되는 경로 구하기
	
	// 폴더 생성하기
	CampingcarDAO cdao = new CampingcarDAO();
	String no = Integer.toString(cdao.getNextNo());
	
	File file = new File(path + File.separator + no); // 번호에 따라 폴더 생성
	if(file.mkdir()) {
		path += File.separator + no; // 파일이 생성 된 것이 맞을 경우 url 수정
		url += "/" + no;
	}
	System.out.println("절대 경로 : " + path);

    //파일정보
    String sFileInfo = "";
    //파일명을 받는다 - 일반 원본파일명
    String filename = request.getHeader("file-name");
    //파일 확장자
    String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
    //확장자를소문자로 변경
    filename_ext = filename_ext.toLowerCase();
 
    //이미지 검증 배열변수
    String[] allow_file = { "jpg", "png", "bmp", "gif" };
 
    //돌리면서 확장자가 이미지인지 
    int cnt = 0;
    for (int i = 0; i < allow_file.length; i++) {
        if (filename_ext.equals(allow_file[i])) cnt++;
    }
 
    //이미지가 아님
    if (cnt == 0) {
        out.println("NOTALLOW_" + filename);
    } else {
		
        String realFileNm = "";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new java.util.Date());
        realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
        
        String rlFileNm = path + File.separator + no + realFileNm;
        ///////////////// 서버에 파일쓰기 ///////////////// 
        InputStream is = request.getInputStream();
        OutputStream os = new FileOutputStream(rlFileNm);
        System.out.println(rlFileNm);
        int numRead;
        byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
        while ((numRead = is.read(b, 0, b.length)) != -1) {
            os.write(b, 0, numRead);
        }
        if (is != null) {
            is.close();
        }
        os.flush();
        os.close();
        ///////////////// 서버에 파일쓰기 /////////////////
 
        // 정보 출력
        sFileInfo += "&bNewLine=true";    
        sFileInfo += "&sFileName=" + filename;    
        sFileInfo += "&sFileURL="+ "../../" + url + "/" + realFileNm;
        out.println(sFileInfo);
        System.out.println(sFileInfo);
    }
%>

