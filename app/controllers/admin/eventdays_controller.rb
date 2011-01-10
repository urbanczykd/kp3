class Admin::EventdaysController < ApplicationController
  layout 'admin'
    before_filter :logtime

  # GET /eventdays
  # GET /eventdays.xml
  def index
    @eventdays = Eventday.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eventdays }
    end
  end

  # GET /eventdays/1
  # GET /eventdays/1.xml
  def show
    @eventday = Eventday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @eventday }
    end
  end

  # GET /eventdays/new
  # GET /eventdays/new.xml
  def new
    @eventday = Eventday.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eventday }
    end
  end

  # GET /eventdays/1/edit
  def edit
    @eventday = Eventday.find(params[:id])
  end

  # POST /eventdays
  # POST /eventdays.xml
  def create
    @eventday = Eventday.new(params[:eventday])

    respond_to do |format|
      if @eventday.save
        format.html { redirect_to([:admin, @eventday], :notice => 'Eventday was successfully created.') }
        format.xml  { render :xml => @eventday, :status => :created, :location => @eventday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @eventday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eventdays/1
  # PUT /eventdays/1.xml
  def update
    @eventday = Eventday.find(params[:id])

    respond_to do |format|
      if @eventday.update_attributes(params[:eventday])
        format.html { redirect_to([:admin, @eventday], :notice => 'Eventday was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @eventday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eventdays/1
  # DELETE /eventdays/1.xml
  def destroy
    @eventday = Eventday.find(params[:id])
    @eventday.destroy

    respond_to do |format|
      format.html { redirect_to(admin_eventdays_url) }
      format.xml  { head :ok }
    end
  end
end
