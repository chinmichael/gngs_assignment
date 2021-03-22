package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.BpMailVO;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
@RequiredArgsConstructor
public class MailImpl implements Mail {

    private final JavaMailSender mailSender;

    public void sendBpMail (final BpMailVO vo) {
        final MimeMessagePreparator preparator = new MimeMessagePreparator() {

            public void prepare(MimeMessage mimeMessage) throws Exception {
                final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                helper.setFrom(vo.getFrom());
                helper.setTo(vo.getTo());
                helper.setSubject(vo.getSubject());
                helper.setText(vo.getContents(), true);
            }
        };

        mailSender.send(preparator);
    }
}
