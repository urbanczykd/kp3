# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
helper_method :current_user

before_filter :set_language

private

def set_language
  I18n.locale ="pl"
end

def current_user_session
  return @current_user_session if defined?(@current_user_session)
  @current_user_session = UserSession.find
end

def current_user
  return @current_user if defined?(@current_user)
  @current_user = current_user_session && current_user_session.record
end

def logtime
    if !current_user
    redirect_to ("/admin/login")
  end    
end

  def nie_puste(par)
        @rok = par.split("-")[0]
        @miesiac = par.split("-")[1]
        @dzien = par.split("-")[2]
        @jutro = @rok.to_s+"-"+@miesiac.to_s+"-"+(par.split("-")[2].to_i+1).to_s
        @this_miesiac = Date.today.strftime("%m").to_i
@dzisiaj = Date.today.strftime("%Y").to_s+"-"+@miesiac.to_s+"-"+Date.today.strftime("%d").to_s
#        @dzisiaj = @rok.to_s+"-"+@miesiac.to_s+"-"+(par.split("-")[2]).to_s
        @base_day = @rok+"-"+@miesiac+"-"+@dzien
        @base_day_first = @rok+"-"+@miesiac+"-"+"1"
        @xday = @base_day.to_s

        @numer = @base_day_first
        @c = Time.local(@rok,@miesiac,@dzien,0,0,1)


  return @rok, @miesiac, @dzien, @jutro, @dzisiaj, @base_day, @base_day_first, @xday, @numer, @c
  end

  def puste
        @rok = Date.today.strftime("%Y")
        @miesiac = Date.today.strftime("%m")
        @dzien = Date.today.strftime("%d")
        @jutro = Date.today+1.day
#        @dzisiaj = Date.today
@dzisiaj = Date.today.strftime("%Y").to_s+"-"+@miesiac+"-"+Date.today.strftime("%d").to_s

        @base_day = @rok.to_s+"-"+@miesiac.to_s+"-"+@dzien.to_s
        @base_day_first = @rok.to_s+"-"+@miesiac.to_s+"-"+"1"
        @xday = @base_day.to_s
        @numer = Date.today.year.to_s+"-"+Date.today.month.to_s+"-1"

    return @rok, @miesiac, @dzien, @jutro, @dzisiaj, @base_day, @base_day_first, @xday, @numer
  end
  #################################################################
  
# Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
