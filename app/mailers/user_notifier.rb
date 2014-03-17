class UserNotifier < ActionMailer::Base

  default from: "Santa Clara EMS scuemsdirector@gmail.com"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[SCU ES] Your credentials have been reset!"
  end

  def password_was_reset(user)
  end



end