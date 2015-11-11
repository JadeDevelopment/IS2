class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: true}

  validates :nombre, :appaterno, :apmaterno, presence: { strict: true }
  validates :email, uniqueness: { message: "El correo ya fue registrado" }

  def serialize_from_session(key,salt)
    #record = to_adapter.get(key[0].to_param)                                                                                                                                 
    record = to_adapter.get(key.to_s)
    record if record && record.authenticatable_salt == salt
  end
end
