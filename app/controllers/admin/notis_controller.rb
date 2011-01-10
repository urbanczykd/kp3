class Admin::NotisController < ApplicationController
  layout "admin"
  before_filter :logtime
  
  def index
    @notis = Zgloszenia.all(:order=> "created_at ASC")
    respond_to do |format|
      format.html # index.html.erb
    end

  end
  def show
    @noti = Zgloszenia.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end

  end
  def destroy
    @noti = Zgloszenia.find(params[:id])
    @noti.destroy

    respond_to do |format|
      format.html { redirect_to(admin_notis_url, :notice => "Zgłoszenie zostało prawidlowo usunięte") }
      format.xml  { head :ok }
    end
  end
end
