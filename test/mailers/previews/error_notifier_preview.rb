# Preview all emails at http://localhost:3000/rails/mailers/error_notifier
class ErrorNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/error_notifier/bad_cart
  def bad_cart
    ErrorNotifier.bad_cart
  end

end
