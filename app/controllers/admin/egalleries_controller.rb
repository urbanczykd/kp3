class Admin::EgalleriesController < ApplicationController
  layout 'admin'
  before_filter :logtime

  # GET /egalleries
  # GET /egalleries.xml
  
  def index
    @egalleries = Egallery.all(:order => "id DESC")
#    @egalleryps = Egalleryp.find(:conditions => {:egalleryp => params[:egalleryps]})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @egalleries }
    end
  end

  # GET /egalleries/1
  # GET /egalleries/1.xml
  def show
    @egallery = Egallery.find(params[:id])
    @egalleryps = Egalleryp.all(:conditions => {:egallery_id => params[:id]})
#    return render :text => "podaję parametry -> #{params.to_yaml}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @egallery }
    end
  end

  # GET /egalleries/new
  # GET /egalleries/new.xml
  def new
    @egallery = Egallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @egallery }
    end
  end

  # GET /egalleries/1/edit
  def edit
    @egallery = Egallery.find(params[:id])
    @egalleryps = Egalleryp.find(:all, :conditions => {:egallery_id => params[:id]}, 
    :order => :position)
    @egalleryp = Egalleryp.new
  end

  # POST /egalleries
  # POST /egalleries.xml
  def create
    @egallery = Egallery.new(params[:egallery])

    respond_to do |format|
      if @egallery.save
        format.html { redirect_to([:admin, @egallery], :notice => 'Egallery was successfully created.') }
        format.xml  { render :xml => @egallery, :status => :created, :location => @egallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @egallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /egalleries/1
  # PUT /egalleries/1.xml
  def update
    @egallery = Egallery.find(params[:id])
    ######################        edycja opisów zdjęć
    if params[:egalleryps_title].present?
       params[:egalleryps_title].each do |k, v|
        Egalleryp.update(k, :title => v)
      end
    end
    ###################### koniec edycji opisów zdjęć

    #######################usuwanie zaznaczonych zdjęć
    if params[:egalleryps_ids].present?
       params[:egalleryps_ids].each do |eg|
            Egalleryp.destroy(eg)
       end
    end
    ###################### koneic usuwania zaznaczonych zdjęć

    respond_to do |format|
      if @egallery.update_attributes(params[:egallery])
        format.html { redirect_to(edit_admin_egallery_path(params[:egallery_id]), :notice => 'Galeria została pomyślnie zaktualizowana.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @egallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /egalleries/1
  # DELETE /egalleries/1.xml
  def destroy
    @egallery = Egallery.find(params[:id])
    @egallery.destroy

    respond_to do |format|
      format.html { redirect_to(admin_egalleries_url, :notice => 'Pomyślnie usunięto galerię') }
      format.xml  { head :ok }
    end
  end
end





