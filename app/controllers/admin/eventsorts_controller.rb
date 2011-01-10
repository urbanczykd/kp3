class Admin::EventsortsController < ApplicationController
  layout 'admin'
  before_filter :logtime
  def index
#    @miejsca = Place.all
      @miejsca = Magazine.find(params[:magazine_id]).miejsce
    @kolejnosc = Magazine.find(params[:magazine_id]).miejsce
#    return render :text => "dupa #{@kolejnosc.nil?}"

      if @kolejnosc.nil? then
#        return render :text => "dupa"
#         @kolejnosc =  @miejsca.collect{|y| y.id }.join(';')
##          @kolejnosc = '1;2;3'
##          @miejsca = '1;2;3'
          @miejsca = Place.count.times.map {|c| c +1}.join(";")
          @kolejnosc = @miejsca
          
          #return render :text => "#{Places.find(:all)}"
   else
         @kolejnosc.split(';').collect{ |k| @miejsca.find{ |m| k.to_i == m.id} }
          
  end
end
  
  def update
        @magazyn = Magazine.find(params[:eventsort][:id])
    respond_to do |format|
      if @magazyn.update_attributes(params[:eventsort])
        format.html { redirect_to(admin_magazine_eventsorts_path(params[:eventsort][:id]), :notice => 'Lista została prawidłowo zaktualizowana.') }
        format.xml  { head :ok }
      else
        return render :text => "Niestety nie udało się zapisać danych!"
        format.html { render :action => "index" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end

  end
  
end
