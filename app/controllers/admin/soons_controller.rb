class Admin::SoonsController < ApplicationController
  layout 'admin'
    before_filter :logtime

  # GET /soons
  # GET /soons.xml

  def move
#		return render :text => "Jestem w move #{params.to_yaml}:)"
	    @soon=Soon.find(params[:id])
      case params[:move]
		    when "up" then @soon.move_higher
	  	  when "down" then @soon.move_lower
  		  when "last" then @soon.move_to_bottom
		    when "first" then @soon.move_to_top
	    end
	  redirect_to admin_magazine_soons_path
  end

  def index
    #zmienić aby wyszukiwał tylko z bieżącego numeru
    @magazine = Magazine.find(:all, :conditions => {:id => params[:magazine_id]})  
    @soons = Soon.find(:all,:conditions => {:magazine_id => params[:magazine_id]}, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @soons }
    end
  end

  # GET /soons/1
  # GET /soons/1.xml
  def show
    @soon = Soon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @soon }
    end
  end

  # GET /soons/new
  # GET /soons/new.xml
  def new
    @soon = Soon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @soon }
    end
  end

  # GET /soons/1/edit
  def edit
    @soon = Soon.find(params[:id])
  end

  # POST /soons
  # POST /soons.xml
  def create
    @soon = Soon.new(params[:soon])

    respond_to do |format|
      if @soon.save
        format.html { redirect_to(admin_magazine_soons_path(@magazine), :notice => 'Wkrótce zostało prawidłowo dodane.') }
        format.xml  { render :xml => @soon, :status => :created, :location => @soon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @soon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /soons/1
  # PUT /soons/1.xml
  def update
    @soon = Soon.find(params[:id])

    respond_to do |format|
      if @soon.update_attributes(params[:soon])
        format.html { redirect_to( admin_magazine_soons_path(@magazine), :notice => 'Wkrótce zostala prawidłowo zaktualizowane.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @soon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /soons/1
  # DELETE /soons/1.xml
  def destroy
    @soon = Soon.find(params[:id])
    @soon.destroy

    respond_to do |format|
      format.html { redirect_to(admin_magazine_soons_url) }
      format.xml  { head :ok }
    end
  end
end




























