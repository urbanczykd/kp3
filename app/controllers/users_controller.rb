class UsersController < ApplicationController
#  before_filter :logtime
  layout 'login'
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Pomyślnie zarejestrowano."
#      redirect_to root_url
       redirect_to ("/admin/users")
    else
      render :action => 'new'
    end
  end
  
  def edit
# @user = User.find(params[:id])
	@user = current_user

  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Pomyślnie edytowano profil."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end