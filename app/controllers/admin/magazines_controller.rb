class Admin::MagazinesController < ApplicationController
  layout "admin"
  before_filter :logtime
  # GET /magazines
  # GET /magazines.xml
  def arch
		@magazines = Magazine.find(:all, :conditions => {:id => params[:magazine_ids]})
      @magazines.each do |ids|
			  Magazine.update(ids.id, :status => '1')
 	    end
	redirect_to admin_magazines_path
  end

  
  def index
    @magazines = Magazine.all(:conditions => {:status => '0'}, :order => "start_date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @magazines }
    end
  end

  # GET /magazines/1
  # GET /magazines/1.xml
  def show
    @magazine = Magazine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @magazine }
    end
  end

  # GET /magazines/new
  # GET /magazines/new.xml
  def new
    @magazine = Magazine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @magazine }
    end
  end

  # GET /magazines/1/edit
  def edit
    @magazine = Magazine.find(params[:id])
    if @magazine.cover
        @cover = @magazine.cover.id
      end

  end

  # POST /magazines
  # POST /magazines.xml
  def create
#return render :text => "parametry -> #{params[:eventsort][:"start_date(1i)"].to_yaml}"
#    nowy = params[:magazine][:"start_date(1i)"]+"-"+params[:magazine][:"start_date(2i)"]+"-1 00:00:00"
nowy = params[:eventsort][:"start_date(1i)"]+"-"+params[:eventsort][:"start_date(2i)"]+"-1 00:00:00"
#return render :text => "dd -> #{nowy}"
if Magazine.first(:conditions => {:start_date => nowy})

      flash[:notice] = "Nie można dodać tego numeru! taki istnieje!."
      redirect_to admin_magazines_path
else

#    @magazine = Magazine.new(params[:magazine])
    @magazine = Magazine.new(params[:eventsort])
    respond_to do |format|
      if @magazine.save
        format.html { redirect_to([:admin, @magazine], :notice => 'Pomyślnie dodano nowy numer!.') }
        format.xml  { render :xml => @magazine, :status => :created, :location => @magazine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @magazine.errors, :status => :unprocessable_entity }
      end
    end
  end
end

  
  # PUT /magazines/1
  # PUT /magazines/1.xml
  def update
    @magazine = Magazine.find(params[:id])

    respond_to do |format|
      if @magazine.update_attributes(params[:magazine])
        format.html { redirect_to([:admin, @magazine], :notice => 'Poprawnie zaktualizowano magazyn.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @magazine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.xml
  def destroy
    @magazine = Magazine.find(params[:id])
    @magazine.destroy

    respond_to do |format|
      format.html { redirect_to(admin_magazines_url) }
      format.xml  { head :ok }
    end
  end
end
