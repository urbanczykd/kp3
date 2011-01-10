class FilmController < ApplicationController
  def index
        if !params[:id].nil?
            nie_puste(params[:id])
        else
            puste
        end

   if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
           #magazine wyszukuje magazyn z bazy
@magazine = Magazine.first(:conditions => {:start_date => @numer })
           # soons w któtce
@soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order=> :position)
       else 
         render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
       end 
#4 to muzyka
    @film = Event.all(:conditions => {:category_id => 5, :magazine_id => @magazine})
  end

  
  def show
    #    if params[:action].include? ["show"].to_s
    # jeżeli jest w akcji show ( a jest ) przekaz puste parametry
    # czyli parametry posiadające "dzisiejszy dzień"
       puste
@magazine = Magazine.first(:conditions => {:start_date => @numer })
@soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order=> :position)
    
    @film = Event.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.xml  { render :xml => @film }
    end
  end

end
