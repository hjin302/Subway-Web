package com.shop.controller.mail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailSend {
//	FileReader reader;
//	BufferedReader buffr;
//	StringBuilder sb = new StringBuilder();
//	 
//	@RequestMapping(value = "/mail/mailSending")
//	public String mailSending(HttpServletRequest request) {
//	
//   String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
//   String totitle   = request.getParameter("totitle");      // 제목
//   String tocontent = request.getParameter("tocontent");    // 내용
//   
//   
//      try {
//         reader = new FileReader(new File("D:/wep_app/spring_project/test/WebContent/addStore/mail.html"));
//         buffr = new BufferedReader(reader);
//         String data = null;
//         
//         while(true) {
//            data = buffr.readLine();
//            if(data==null)break;
//            sb.append(data);
//         }
//      } catch (FileNotFoundException e) {
//         e.printStackTrace();
//      } catch (IOException e) {
//         e.printStackTrace();
//      }finally {
//         if(buffr!=null) {
//            try {
//               buffr.close();
//            } catch (IOException e) {
//               e.printStackTrace();
//            }
//         }
//      }
//   
//   
//   
//      //SMTP 주소, 포트, 각정설정 세팅..
//      Properties prop = System.getProperties();
//      
//      prop.put("mail.smtp.starttls.enable", "true"); //tls, ssl 인증기능 사용 여부
//      prop.put("mail.smtp.host", "smtp.gmail.com");
//      prop.put("mail.smtp.auth", "true");
//      prop.put("mail.smtp.port", "587");
//      
//      //권한 객체 가져오기
//      Authenticator auth =  new AuthImpl();
//      
//      //보낼 메세지 구성...(세션 객체가 필요함)
//      Session session = Session.getDefaultInstance(prop, auth);
//      MimeMessage message = new MimeMessage(session);
//      
//      //보낸 시간 설정
//      try {
//         message.setSentDate(new Date());
//         
//         //보낸사람 주소, 받을사람, 제목, 내용..
//         message.setFrom(new InternetAddress("hajin.dev302@gmail.com", "hajin"));
//         InternetAddress to = new InternetAddress(tomail);
//         message.setRecipient(Message.RecipientType.TO, to);
//         
//         message.setSubject(totitle, "UTF-8");
//         message.setText(tocontent, "UTF-8");
//         //message.setContent(sb.toString(), "text/html;charset=UTF-8");
//         
//         //전송 시작!
//         Transport.send(message);
//         
//      } catch (MessagingException e) {
//         e.printStackTrace();
//      } catch (UnsupportedEncodingException e) {
//         e.printStackTrace();
//      }
//   
//      return "admin/addStore/index";
//	}
}