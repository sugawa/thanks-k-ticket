require 'test_helper'

class MailSenderTest < ActionMailer::TestCase
  test "inquiry" do
    mail = MailSender.inquiry
    assert_equal "Inquiry", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
