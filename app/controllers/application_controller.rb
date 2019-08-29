class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :session_create

  private
    def session_create
  	  log_in unless log_in?
    end
end
