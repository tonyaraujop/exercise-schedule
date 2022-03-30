class User::SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])
  
    if user && user.valid_password?(sign_in_params[:password])
      user.encode_jwt
      redirect_to routines_path
    else
      redirect_to new_user_registration_path, status: :unprocessable_entity
    end
  end
end
