class MembersController < ApplicationController

  def index
    @members = User.all.entries
  end

  def new
  end

  def create
    log_user_in(User.register_user (user_params))
  end

  # def select
  # end

  # def update
  # end

  # def destroy
  # end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

