class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hola
    render html: "¡Hola, mundo!"
  end

  def goodbye
    render html: "Good bye, World!"
  end
end
