package mail;
import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator {
	

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        //return new PasswordAuthentication("hw8400@naver.com","rain124856");
        return new PasswordAuthentication("masiro7@naver.com","mx994pw5!");
    }
}
 