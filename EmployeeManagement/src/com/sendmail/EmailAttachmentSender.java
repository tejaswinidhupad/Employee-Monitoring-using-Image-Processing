package com.sendmail;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
* This class is used for sending emails to email users
* @author Sujit Thorat
*
*/
public class EmailAttachmentSender {

    /**
     * This method is used to send Email with attached image share to given user
     * @param host
     * @param port
     * @param userName (Sender Email Address)
     * @param password (Sender Password)
     * @param toAddress (Receiver Address)
     * @param subject
     * @param message
     * @param attachFiles
     * @throws AddressException
     * @throws MessagingException
     */
 public static void sendEmailWithAttachments( String toAddress,String message)
throws AddressException, MessagingException {
// sets SMTP server properties
	 String host="smtp.gmail.com";
	 String port = "587";
	 final String userName="opulentinfotech7219809971@gmail.com";
	 final String password="7219809971";
	 String subject="Labour Contract Mail";
	  String[] attachFiles=null;
	 
	 
Properties properties = new Properties();
properties.put("mail.smtp.host", host);
properties.put("mail.smtp.port", port);
properties.put("mail.smtp.auth", "true");
properties.put("mail.smtp.starttls.enable", "true");
properties.put("mail.user", userName);
properties.put("mail.password", password);

// creates a new session with an authenticator
Authenticator auth = new Authenticator() {
public PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(userName, password);
}
};
Session session = Session.getInstance(properties, auth);

// creates a new e-mail message
Message msg = new MimeMessage(session);

msg.setFrom(new InternetAddress(userName));
InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
msg.setRecipients(Message.RecipientType.TO, toAddresses);
msg.setSubject(subject);
msg.setSentDate(new Date());

// creates message part
MimeBodyPart messageBodyPart = new MimeBodyPart();
messageBodyPart.setContent(message, "text/html");

// creates multi-part
Multipart multipart = new MimeMultipart();
multipart.addBodyPart(messageBodyPart);

// adds attachments
if (attachFiles != null && attachFiles.length > 0) {
for (String filePath : attachFiles) {
MimeBodyPart attachPart = new MimeBodyPart();

try {
attachPart.attachFile(filePath);
} catch (IOException ex) {
ex.printStackTrace();
}

multipart.addBodyPart(attachPart);
}
}

// sets the multi-part as e-mail's content
msg.setContent(multipart);

// sends the e-mail
Transport.send(msg);

}
}