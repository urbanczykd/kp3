class KalendariumController < ApplicationController

def index
    if !params[:id].nil?
        nie_puste(params[:id])
     @notes = Event.day_range(params[:id].to_date)
      else
        puste
     @notes = Event.day_range(Time.now)
      end

    if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
    #magazine wyszukuje magazyn z bazy
    @magazine = Magazine.first(:conditions => {:start_date => @numer })
    # soons w któtce
    @soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order => :position)
    
#        return render :text => "magazyn.id #{@magazine.id}"
  else 
    render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
    end 

  end
end
