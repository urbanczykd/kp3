class UserSessionsController < ApplicationController
  layout 'login'
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Pomyślnie zalogowano."
#      redirect_to root_url
      redirect_to admin_magazines_path
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Zostałeś pomyślnie wylogowany."
    redirect_to root_url
  end
end
