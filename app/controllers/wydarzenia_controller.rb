class WydarzeniaController < ApplicationController
  layout 'pk'

  def index
      if !params[:id].nil?
        nie_puste(params[:id])
     @notes = Event.date_range(Time.now)
      else
        puste
      end
      
    #????????????????????????????????????????????????????????#
    if !Magazine.first(:conditions => {:start_date => @numer }).nil? then
    #magazine wyszukuje magazyn z bazy
     @magazine = Magazine.first(:conditions => {:start_date => @numer })
    # soons w któtce
     @soons = Soon.find(:all, :conditions => {:magazine_id => @magazine.id}, :order => :position)
    #importend adress, ważne adresy 
     @iadres = Iadre.all(:order => :position)
    #wydarzenia główne
 @notes = Event.date_range(Time.now)
     #sprawdza czy istnieje kolejnosc wyświetlania wydarzenień jeżeli nie tymczasowo 
     #segreguje wg kolejności kluczy id

     if @magazine.miejsce == 'NULL' then
        @magazine.miejsce =  Place.all.collect{|y| y.id }.join(';')
     end

 @kolejnosc = @magazine.miejsce
 @miejsca = Place.all
if !@wydarzenia.nil?
 @wydarzenia =  @kolejnosc.split(';')
end
    @topones = Topone.all(:conditions => {:magazine_id => @magazine.id }, :order => :position)
    #obsługa generowania galerii wewnątrz artykułów
        @topones.each do |topone|
          gallery_id = topone.body.scan(/\{gallery=(\d+)\}/).flatten[0]
            if !Egallery.find(:first, :conditions => {:id, gallery_id}).nil?
              content = render_to_string :partial => 'gallery', :locals => {:id => gallery_id}
              topone.body.gsub! /\{gallery=\d+\}/, content
            else 
              topone.body.gsub! /\{gallery=\d+\}/, ''
            end
        end
    else 
     render :action => :index, :id => Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"
    end
  end

end


























































