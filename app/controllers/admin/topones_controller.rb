class Admin::ToponesController < ApplicationController
  layout 'admin'
    before_filter :logtime

  uses_tiny_mce(:options => AppConfig.advanced_mce_options, :only => [:new, :edit])

  # GET /topones
  # GET /topones.xml
  def move
	    @topone=Topone.find(params[:id])
      case params[:move]
		    when "up" then @topone.move_higher
	  	  when "down" then @topone.move_lower
  		  when "last" then @topone.move_to_bottom
		    when "first" then @topone.move_to_top
	    end
	  redirect_to admin_magazine_topones_path
  end
  
  def index
    #zminić aby wyszukiwał tylko z bieżącego numeru
    @topones = Topone.find(:all, :conditions => {:magazine_id => params[:magazine_id]},:order => :position)
    @magazine = Magazine.find(:all, :conditions => {:id => params[:magazine_id]})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topones }
    end
  end

  # GET /topones/1
  # GET /topones/1.xml
  def show
    @topone = Topone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topone }
    end
  end

  # GET /topones/new
  # GET /topones/new.xml
  def new
    @topone = Topone.new
    @sponsors = Sponsor.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topone }
    end
  end

  # GET /topones/1/edit
  def edit
    @topone = Topone.find(params[:id])
    @all_sponsors = Sponsor.find(:all)
    @sponsors = Topone.find(params[:id]).sponsors
  end

  # POST /topones
  # POST /topones.xml
  def create
#    return render :text => "podaję parametry-> #{params.to_yaml}"
    @topone = Topone.new(params[:topone])

    respond_to do |format|
      if @topone.save
        format.html { redirect_to(admin_magazine_topones_path(@magazine), :notice => 'Topone zostało prawidłowo dodane.') }
        format.xml  { render :xml => @topone, :status => :created, :location => @topone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topones/1
  # PUT /topones/1.xml
  def update
    @topone = Topone.find(params[:id])

    if params[:topone][:sponsor_ids].nil?
      Sponsorization.destroy_all(:topone_id => params[:id] )
#      return render :text => "#{@topone.sponsorization.to_yaml}"
    end 
    respond_to do |format|
      if @topone.update_attributes(params[:topone])
        format.html { redirect_to(admin_magazine_topones_path(@magazine), :notice => 'Topone zostało prawidłowo zaktualizowane.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topones/1
  # DELETE /topones/1.xml
  def destroy
    @topone = Topone.find(params[:id])
    @topone.destroy

    respond_to do |format|
      format.html { redirect_to(admin_magazine_topones_url) }
      format.xml  { head :ok }
    end
  end
end



































