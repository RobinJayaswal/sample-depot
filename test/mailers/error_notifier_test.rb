require 'test_helper'

class ErrorNotifierTest < ActionMailer::TestCase
  test "bad_cart" do
    mail = ErrorNotifier.bad_cart
    assert_equal "Bad cart", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
