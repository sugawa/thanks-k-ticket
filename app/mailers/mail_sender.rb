# coding:utf-8
class MailSender < ActionMailer::Base
  default from: "Thanks!Kオーケストラ <ticket@thanks-k.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_sender.entry.subject
  #
  def entry(reserve)
    @reserve = reserve

    mail :to => @reserve.email
    mail :bcc => ["thanksk.orch.ticket@gmail.com", "hs0316@gmail.com"]
    mail :subject => "[Thanks!Kオーケストラ第２回演奏会][発券番号：#{@reserve.id}]ご予約ありがとうございました。"
  end
end
