class UsersController < ApplicationController

  def index
    # @users = User.all.entries
    if params[:status] == "vet"
      @users = User.where(:status => "vet")
    elsif params[:status] == "rookie"
      @users = User.where(:status => "rookie")
    else
      @users = User.all.entries
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.register_user (user_params)
    log_user_in (@user)

  end

  def show
   @user = User.find_by_id( params[:id] )
  end

  def edit
    @user = User.find_by_id( params[:id] )
  end

  def update
    @user = User.find_by_id( params[:id] )
    @user.update (user_params)
    render :show
  end

  def destroy
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :status, :image)
  end

  def user_params_for_edit
    params.require(:user).permit(:first_name, :last_name, :email, :status)
  end

  def avatar
    content = @user.avatar.read
    if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, type: @user.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

end

