class Admin::ArchiwesController < ApplicationController
  layout "admin"
    before_filter :logtime

# GET /archiwes
# GET /archiwes.xml
	def unarch
	@archiwes = Magazine.find(:all, :conditions => {:id => params[:archiwe_ids]})

		@archiwes.each do |ids|
#  return render :text => "The object is #{ids.to_yaml}"

			Magazine.update(ids.id, :status => '0')
		end
		redirect_to admin_archiwes_url
	end

  def index
    @archiwes = Magazine.find(:all, :conditions => {:status => '1'})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @archiwes }
    end
  end

  def destroy
    @magazine = Magazine.find(params[:id])
    @magazine.destroy

    respond_to do |format|
      format.html { redirect_to(admin_archiwes_url) }
      format.xml  { head :ok }
    end
  end
end
