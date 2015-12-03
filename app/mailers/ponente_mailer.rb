class PonenteMailer < ApplicationMailer
	default :from => "comentconexciencia@gmail.com"

	def disponible_email(user, activity)
    	@usuario = user
    	@url  = "http://localhost:3000/ponentes/sign_in"
    	@actividad = activity
    	mail(:to => @usuario.email, :subject => "Curso ya disponible")
  	end
end
