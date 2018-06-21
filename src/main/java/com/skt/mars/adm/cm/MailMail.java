package com.skt.mars.adm.cm;

import java.io.FileNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class MailMail {
	@Autowired
	private MailSender mailSender;
/*	 
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
*/ 
	public String sendMail(String from, String to, String username, String password, String userID) {
 
		SimpleMailMessage message = new SimpleMailMessage();
 
		String subject = null;
		String msg = null;
		
		subject = "Assistance of your ID,Password.\n\n";
		msg = "\n  Name : " + username;
		msg += "\n  ID : " + userID;
		msg += "\n  Password : " + password;
		msg += "\n\n - Careful not to expose your information.\n - This is a post-only mailing. Replies to this message are not monitored or answered.";
		
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(msg);
		
		try{
			mailSender.send(message);
		} catch (Exception e)  {
			return "102" ; 	// error send mail
		}
		
		return "100" ;
	}

}
