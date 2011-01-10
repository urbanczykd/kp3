class Admin::IadresController < ApplicationController
  layout 'admin'
    before_filter :logtime

  # GET /iadres
  # GET /iadres.xml

  
  def move
#		return render :text => "Jestem w move #{params.to_yaml}:)"
	    @iadre=Iadre.find(params[:id])
      case params[:move]
		    when "up" then @iadre.move_higher
	  	  when "down" then @iadre.move_lower
  		  when "last" then @iadre.move_to_bottom
		    when "first" then @iadre.move_to_top
	    end
	  redirect_to admin_iadres_path
  end

  
  def index
    @iadres = Iadre.all(:order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @iadres }
    end
  end

  # GET /iadres/1
  # GET /iadres/1.xml
  def show
    @iadre = Iadre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @iadre }
    end
  end

  # GET /iadres/new
  # GET /iadres/new.xml
  def new
    @iadre = Iadre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @iadre }
    end
  end

  # GET /iadres/1/edit
  def edit
    @iadre = Iadre.find(params[:id])
  end

  # POST /iadres
  # POST /iadres.xml
  def create
    @iadre = Iadre.new(params[:iadre])

    respond_to do |format|
      if @iadre.save
        format.html { redirect_to([:admin, @iadre], :notice => 'Adres został pomyślnie dodany.') }
        format.xml  { render :xml => @iadre, :status => :created, :location => @iadre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @iadre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /iadres/1
  # PUT /iadres/1.xml
  def update
    @iadre = Iadre.find(params[:id])

    respond_to do |format|
      if @iadre.update_attributes(params[:iadre])
        format.html { redirect_to([:admin, @iadre], :notice => 'Adres został zakutalizowany.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @iadre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /iadres/1
  # DELETE /iadres/1.xml
  def destroy
    @iadre = Iadre.find(params[:id])
    @iadre.destroy

    respond_to do |format|
      format.html { redirect_to(admin_iadres_url) }
      format.xml  { head :ok }
    end
  end
end



