class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id, :residence, :organization_name, :organization_desription, :organization_opportunities, :organization_website, :verification_status)
  end
end
