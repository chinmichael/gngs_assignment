package com.gngs.gngs_assignment.model;

public class BpMailVO extends MailVO {

    public void setContents (String who, String username, String uuid) {
        StringBuffer sb = new StringBuffer();

        sb.append(who);
        sb.append("<br/><br/>");
        sb.append("いつも大変お世話になっております。<br/>");
        sb.append("株式会ジエンジサービスの" + username + "です。");
        sb.append("<br/><br/>");
        sb.append("基本契約の手続きのため、御社の基本情報が必要ですので<br/>");
        sb.append("ご確認の上ご対応のほどよろしくお願い致します。");
        sb.append("<br/><br/>");
        sb.append("下記のURLより登録を行ってください。<br/>");
        sb.append("<a href=\"http://172.30.1.43:8000/bp/bpRegist?key="+uuid+"\">");
        sb.append("http://172.30.1.43:8005/bp/bpRegist?key="+uuid+"</a>");
        sb.append("<br/><br/>");
        sb.append("<本件に関する問い合わせ先>");
        sb.append("株式会社ジエンジサービス<br/>");
        sb.append("担当：金土村（kimdo@gngs.co.jp）<br/>");
        sb.append("電話：03-6435-0349");
        sb.append("<br/><br/>");
        sb.append("よろしくお願い申し上げます。");

        super.setContents(sb.toString());
    }

}
