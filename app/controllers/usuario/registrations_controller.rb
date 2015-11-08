class Usuario::RegistrationsController < Devise::RegistrationsController
prepend_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nombre, :appaterno, :apmaterno, :institucion, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nombre, :appaterno, :apmaterno, :institucion, :email, :password, :password_confirmation, :current_password) }
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) << [:nombre, :appaterno, :apmaterno]
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
