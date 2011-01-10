class ZgloszeniasController < ApplicationController
  # GET /zgloszenias
  # GET /zgloszenias.xml
  def index
    #####################    
    if !params[:id].nil?
        nie_puste(params[:id])
      else
        puste
      end
    
      if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
       #magazine wyszukuje magazyn z bazy
       @magazine = Magazine.first(:conditions => {:start_date => @numer })
       # soons w któtce
       @soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order => :position)
    else 
#       render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
    end 
    ###################

    render :action => "new"
#    @zgloszenias = Zgloszenia.all

#   respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @zgloszenias }
#    end
  end

  # GET /zgloszenias/1
  # GET /zgloszenias/1.xml
  def show
    @zgloszenia = Zgloszenia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zgloszenia }
    end
  end

  # GET /zgloszenias/new
  # GET /zgloszenias/new.xml
  def new
    #####################    
    if !params[:id].nil?
        nie_puste(params[:id])
      else
        puste
      end
    
      if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
       #magazine wyszukuje magazyn z bazy
       @magazine = Magazine.first(:conditions => {:start_date => @numer })
       # soons w któtce
       @soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order => :position)
    else 
#       render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
    end 
    ###################
    
    @zgloszenia = Zgloszenia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zgloszenia }
    end
  end

  # GET /zgloszenias/1/edit
  def edit
    @zgloszenia = Zgloszenia.find(params[:id])
  end

  # POST /zgloszenias
  # POST /zgloszenias.xml
  def create
#    return render :text => "parametry-> #{params.to_yaml}"
    #####################    
    if !params[:id].nil?
        nie_puste(params[:id])
    else
        puste
      end
    
      if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
     #magazine wyszukuje magazyn z bazy
       @magazine = Magazine.first(:conditions => {:start_date => @numer })
       # soons w któtce
       @soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order => :position)
      else 
       render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
    end 
    ###################
#return render :text => "jestem w create"
    @zgloszenia = Zgloszenia.new(params[:zgloszenia])

    respond_to do |format|
      if @zgloszenia.save
        format.html { redirect_to("/zgloszenia", :notice => 'Zgłoszenie zostało prawidłowo dodane.') }
        format.xml  { render :xml => @zgloszenia, :status => :created, :location => @zgloszenia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zgloszenia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zgloszenias/1
  # PUT /zgloszenias/1.xml
  def update
    @zgloszenia = Zgloszenia.find(params[:id])

    respond_to do |format|
      if @zgloszenia.update_attributes(params[:zgloszenia])
        format.html { redirect_to(@zgloszenia, :notice => 'Zgłoszenie zostało prawidłowo zaktualizowane.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zgloszenia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zgloszenias/1
  # DELETE /zgloszenias/1.xml
  def destroy
    @zgloszenia = Zgloszenia.find(params[:id])
    @zgloszenia.destroy

    respond_to do |format|
      format.html { redirect_to(zgloszenias_url) }
      format.xml  { head :ok }
    end
  end
end
