class UserNotifier < ActionMailer::Base

  LINK_TO_RESET = "[SCU EMS] Reset your credentials."
  PASSWORD_WAS_RESET = "[SCU EMS] Your credentials have been reset!"

  default from: "Santa Clara EMS scuemsdirector@gmail.com"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end

  def password_was_reset(user)
  	@user = user
  	mail to: @user.email, subject: PASSWORD_WAS_RESET
  end



end