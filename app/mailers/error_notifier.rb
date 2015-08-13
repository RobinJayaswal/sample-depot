class ErrorNotifier < ActionMailer::Base
  default from: "Robin Jayaswal <robinj.lincoln@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.error_notifier.bad_cart.subject
  #
  def bad_cart(error)
    @error = error

    mail to: "robin.e.jayaswal.18@dartmouth.edu", subject: "Error Notification"
  end
end
