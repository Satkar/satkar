require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :latest_album
  before_action :latest_two_albumms

  private
  	def latest_album
  		@latest_album = Album.latest
  	end

  	def latest_two_albumms
  		@latest_two_albumms = Album.latest_two_albums
  	end
end
