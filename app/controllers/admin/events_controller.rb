class Admin::EventsController < ApplicationController
  layout 'admin'
    before_filter :logtime

  uses_tiny_mce(:options => AppConfig.advanced_mce_options, :only => [:new, :edit])
  # GET /events
  # GET /events.xml
  def index
	@events = Event.lista(params[:page], params[:magazine_id])
  @magazine = Magazine.find(:all, :conditions => {:id => params[:magazine_id]})
    
#return render :text => "The object is: #{@magazine.to_yaml}"
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @egalleries = Egallery.find(:all)
    @eventdays = Eventday.find(:all, :conditions => {:event_id => params[:id]})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end
  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @magazine = Magazine.find(:all, :conditions => {:id => params[:magazine_id]})
    @places = Place.find(:all)
    @eventdays = Eventday.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @eventdays = Eventday.find(:all, :conditions => {:event_id => params[:id]})
    @magazine = Magazine.find(:all, :conditions => {:id => params[:magazine_id]})
    @places = Place.find(:all)
   
  end

  # POST /events
  # POST /events.xml
  def create

 hour = params[:event][:"start_time(4i)"]
 minute = params[:event][:"start_time(5i)"]

@event = Event.create(params[:event])

params[:event][:when].split(';').map do |e|
	@event.eventdays.create :pday => DateTime.parse("#{hour}:#{minute} #{e}")
end

    respond_to do |format|
      if @event.save
        format.html { redirect_to(admin_magazine_events_path(@magazine), 
                    :notice => 'Poprawnie dodano event.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
#    return render :text => "parametry => #{params.to_yaml}"
#    params[:event][:update_id]
#return render :text => "#{params[:id].to_yaml}"
    @old = Eventday.find(:all, :conditions => {:event_id => params[:id]})
           Eventday.destroy_all(:id => @old)
#??           Event.destroy(params[:id])
@event = Event.find(:first, :conditions => {:id => params[:id]})
 hour = params[:event][:"start_time(4i)"]
 minute = params[:event][:"start_time(5i)"]

#      return render :text => "#{params.to_yaml}"
 # @event = Event.create(params[:event])

    params[:event][:when].split(';').map do |e|
	    @event.eventdays.create :pday => DateTime.parse("#{hour}:#{minute} #{e}")
    end
      
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(admin_magazine_events_path(@magazine), :notice => 'Event został prawidłowo zaktualizowany.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(admin_magazine_events_url, :notice => 'Event został prawidłowo usunięty') }
      format.xml  { head :ok }
    end
  end
end
