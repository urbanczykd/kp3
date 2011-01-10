class Admin::CoversController < ApplicationController
  layout "admin"
    before_filter :logtime

  # GET /covers
  # GET /covers.xml
  def index
    @covers = Cover.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @covers }
    end
  end

  # GET /covers/1
  # GET /covers/1.xml
  def show
    @cover = Magazine.find(params[:magazine_id]).cover
    @magazine = Magazine.find(params[:magazine_id]) #??

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cover }
    end
  end

  # GET /covers/new
  # GET /covers/new.xml
  def new
    @magazine = Magazine.find(params[:magazine_id])
    @cover = Cover.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cover }
    end
  end

  # GET /covers/1/edit
  def edit
  @magazine = Magazine.find(params[:magazine_id])
  @cover = Cover.find(:first, :conditions => {:magazine_id => params[:magazine_id]})
  end

  # POST /covers
  # POST /covers.xml
  def create
    @magazine = Magazine.find(params[:magazine_id])
    @cover = Cover.new(params[:cover])

    respond_to do |format|
      if @cover.save
        format.html { redirect_to([:admin, @magazine], :notice => 'Cover was successfully created.') }
        format.xml  { render :xml => @cover, :status => :created, :location => @cover }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cover.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /covers/1
  # PUT /covers/1.xml
  def update
#    @cover = Cover.find(params[:id])
#    @cover = Cover.find(:first, :conditions => {:id => params[:cover][:cover_id]}) #??????????
@cover = Magazine.find(params[:magazine_id]).cover

#return render :text => "The object is: #{params.to_yaml}"
#    @cover = Cover.find(:first, :conditions => {:magazine_id => params[:magazine_id]})

    respond_to do |format|
      if @cover.update_attributes(params[:cover])
        format.html { redirect_to(admin_magazine_cover_url(@magazine), :notice => 'Cover was successfully updated.') }	
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cover.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /covers/1
  # DELETE /covers/1.xml
  def destroy
    @magazine = Magazine.find(params[:magazine_id])
    @cover = Magazine.find(params[:magazine_id]).cover
#    @cover = Cover.find(params[:id])
    @cover.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @magazine]) }
      format.xml  { head :ok }
    end
  end
end
