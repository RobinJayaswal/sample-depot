class OrderNotifier < ActionMailer::Base
  default from: "Robin Jayaswal <robinj.lincoln@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.recieved.subject
  #
  def recieved(order)
    @order = order

    mail to: order.email, subject: "#{order.name}, thank you for your order at Jayaswal Ind."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
