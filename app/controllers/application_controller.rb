class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'admin', password: 'admin', except: %i[index show]
  protect_from_forgery with: :exception
end
