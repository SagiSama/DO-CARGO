module Worker

class PasswordsController < Devise::PasswordsController

  def new
  p '________________________RESET_PASSWORD_____________-',params
  p '________________________RESET_PASSWORD_____________-'
    super
  end

  def create
  p '_______CREATE____________RESET_PASSWORD_____________-',params
  p '_______CREATE_________________RESET_PASSWORD_____________-'
    super
  end

  def edit
    p '_______EDIT PASS_____________-',params
    p '_______EDIT PASS_____________-'
    super
  end

  # PUT /resource/password
  def update
  p '_______UPDATE PASS_____________-',params
      p '_______UPDATE PASS_____________-'
    super
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end

end
