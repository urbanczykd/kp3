class ArchiwumController < ApplicationController

  def index
      if !params[:id].nil?
        nie_puste(params[:id])
      else
        puste
      end
       @archiwes = Magazine.find(:all, :conditions => {:status => 1}, :order => 'start_date')
       @archiwes_years = @archiwes.group_by { |t| t.start_date.beginning_of_year }

#      @tasks = Task.find(:all, :order => 'due_at, id', :limit => 50)
#      @task_months = @tasks.group_by { |t| t.due_at.beginning_of_month }

    
    if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
       #magazine wyszukuje magazyn z bazy
       @magazine = Magazine.first(:conditions => {:start_date => @numer })
       # soons w któtce
       @soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order => :position)
    else 
       render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
    end 

  end


end
