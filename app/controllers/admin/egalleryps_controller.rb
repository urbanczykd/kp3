class Admin::EgallerypsController < ApplicationController
  layout 'admin'
    before_filter :logtime

  session :cookie_only => false, :only => :create
  # GET /egalleryps
  # GET /egalleryps.xml

  def move
    @egalleryp = Egalleryp.find(params[:id])
    @egallery = Egalleryp.find(params[:id]).egallery_id
       case params[:move]
        		when "up" then @egalleryp.move_higher
        		when "down" then @egalleryp.move_lower
        		when "last" then @egalleryp.move_to_bottom
        		when "first" then @egalleryp.move_to_top
      	end
      redirect_to edit_admin_egallery_path(@egallery)
  end
  
  def index
    @egalleryps = Egalleryp.all
#return render :text => "The object is: #{params.to_yaml}"    
@egallery = Egallery.find(params[:egallery_id])

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @egalleryps }
    end
  end

  # GET /egalleryps/1
  # GET /egalleryps/1.xml
  def show
    @egalleryp = Egalleryp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @egalleryp }
    end
  end

  # GET /egalleryps/new
  # GET /egalleryps/new.xml
  def new
    @egalleryp = Egalleryp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @egalleryp }
    end
  end

  # GET /egalleryps/1/edit
  def edit
    @egalleryp = Egalleryp.find(params[:id], :order => :position)
  end

  # POST /egalleryps
  # POST /egalleryps.xml
  def create
    
    @egallery = params[:egallery_id]
    @egalleryp = Egalleryp.new(params[:egalleryp])
    
respond_to do |format|
  if @egalleryp.save
   format.html { redirect_to(edit_admin_egallery_url(@egallery), :notice => 'Poprawnie dodano zdjęcie.') }
  format.xml  { render :xml => @egalleryp, :status => :created, :location => @egalleryp }
else
 format.html { render :action => "new" }
format.xml  { render :xml => @egalleryp.errors, :status => :unprocessable_entity }
end
end
end

  # PUT /egalleryps/1
  # PUT /egalleryps/1.xml
  def update
    @egalleryp = Egalleryp.find(params[:id])
    
    respond_to do |format|
      if @egalleryp.update_attributes(params[:egalleryp])
        format.html { redirect_to([:admin, @egalleryp], :notice => 'Poprawnie zaktualizowano galerię.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @egalleryp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /egalleryps/1
  # DELETE /egalleryps/1.xml
  def destroy
    @egalleryp = Egalleryp.find(params[:id])
    @egalleryp.destroy

    respond_to do |format|
      format.html { redirect_to(admin_egalleryps_url) }
      format.xml  { head :ok }
    end
  end
end
