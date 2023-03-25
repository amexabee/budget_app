class CustomRegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
