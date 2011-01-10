class Admin::UsersController < ApplicationController
  layout "admin"
  before_filter :logtime

     def move
#		return render :text => "Jestem w move #{params.to_yaml}:)"
	@user=User.find(params[:id])
#		return render :text => "Jestem w move #{@}:)"
	case params[:move]
		when "up" then @user.move_higher
		when "down" then @user.move_lower
		when "last" then @user.move_to_bottom
		when "first" then @user.move_to_top
	end
	redirect_to admin_users_path
     end

    def index
    @users = User.all(:order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Pomyślnie zarejestrowano."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
# @user = User.find(params[:id])
	@user = current_user
  s
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
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_path, :notice => 'Prawidłowo usunięto użytkownika!') }
      format.xml  { head :ok }
    end

  end
    
end












































