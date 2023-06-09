class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @articles= @user.articles.paginate(page: params[:page], per_page: 4)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Alpha blog, #{@user.username} has successfully signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice]="The update was successful"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if current_user != @user && !current_user.admin?
      redirect_to @user
    else
      @user.destroy
      session[:user_id]=nil if current_user == @user
      flash[:notice] = "The user and the associated articles are deleted."
      redirect_to root_path
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own user."
      redirect_to @user
    end
  end

 

end