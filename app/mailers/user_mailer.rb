class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
<<<<<<< HEAD
    mail to: user.email, subject: t("activateaccount")
=======
    mail to: user.email, subject: t("activate") + t("account")
>>>>>>> sign in up mail
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("password_reset")
  end
end
