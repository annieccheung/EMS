class MembersController < ApplicationController

  def index
    @members = User.all.entries
  end

  def new
  end

  def create
    @user = User.register_user (user_params)
    log_user_in (@user)
  end

  def show
   @user = User.find_by_id( params[:id] )
  end

  # def update
  # end

  # def destroy
  # end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :status, :image)
  end

  def avatar
    content = @user.avatar.read
    if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, type: @user.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

end

