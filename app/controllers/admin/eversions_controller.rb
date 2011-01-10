class Admin::EversionsController < ApplicationController
  layout "admin"
    before_filter :logtime

  # GET /eversions
  # GET /eversions.xml
  def index
    @eversions = Eversion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eversions }
    end
  end

  # GET /eversions/1
  # GET /eversions/1.xml
  def show
    @eversion = Magazine.find(params[:magazine_id]).eversion

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @eversion }
    end
  end

  # GET /eversions/new
  # GET /eversions/new.xml
  def new
    @magazine = Magazine.find(params[:magazine_id]) ## żeby przekierowanie w widoku działało do back
    @eversion = Eversion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eversion }
    end
  end

  # GET /eversions/1/edit
  def edit
    @magazine = Magazine.find(params[:magazine_id])
    @eversion = Eversion.find(:first, :conditions => {:magazine_id => params[:magazine_id]})
  end

  # POST /eversions
  # POST /eversions.xml
  def create
    @magazine = Magazine.find(params[:magazine_id])
    @eversion = Eversion.new(params[:eversion])
    
#    return render :text => "The object is: #{params.to_yaml}"

    respond_to do |format|
      if @eversion.save
        format.html { redirect_to([:admin, @magazine], :notice => 'Eversion was successfully created.') }
        format.xml  { render :xml => @eversion, :status => :created, :location => @eversion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @eversion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eversions/1
  # PUT /eversions/1.xml
  def update
#    @eversion = Eversion.find(params[:id])
    @eversion = Eversion.find(params[:magazine_id]).eversion
#    return render :text => "The object is: #{params.to_yaml}"
    
    respond_to do |format|
      if @eversion.update_attributes(params[:eversion])
        format.html { redirect_to([:admin, @eversion], :notice => 'Eversion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @eversion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eversions/1
  # DELETE /eversions/1.xml
  def destroy
    @magazine = Magazine.find(params[:magazine_id])
    @eversion = Eversion.find(:first, :conditions => {:magazine_id => params[:magazine_id]})

    @eversion.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @magazine]) }
      format.xml  { head :ok }
    end
  end
end
