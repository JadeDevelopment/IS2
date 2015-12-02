class Ponente < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: true}

  validates :nombreusuario, presence: { strict: true }, uniqueness: { message: "El usuario ya esta registrado" }

  def serialize_from_session(key,salt)
    #record = to_adapter.get(key[0].to_param)                                                                                                                                 
    record = to_adapter.get(key.to_s)
    record if record && record.authenticatable_salt == salt
  end


  
end
