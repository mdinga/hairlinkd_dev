require 'test_helper'

class RegisterMailerTest < ActionMailer::TestCase
  test "new_stylist" do
    mail = RegisterMailer.new_stylist
    assert_equal "New stylist", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_client" do
    mail = RegisterMailer.new_client
    assert_equal "New client", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
