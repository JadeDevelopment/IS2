class UsuarioMailer < ApplicationMailer
	default :from => "comentconexciencia@gmail.com"

	def disponible_email(user, activity)
    	@usuario = user
    	@url  = "http://localhost:3000/usuarios/sign_in"
    	@actividad = activity
    	mail(:to => @usuario.email, :subject => "Curso ya disponible")
  	end
end
