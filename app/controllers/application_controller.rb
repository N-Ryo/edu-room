class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!,except: [:index] ,if: :home_controller?

  def home_controller?
    self.controller_name == "home"
  end
end
