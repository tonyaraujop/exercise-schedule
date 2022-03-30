class User::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(sign_up_params)
  
    if user.save
      user.encode_jwt
      redirect_to routines_path
    else
      redirect_to new_user_registration_path, status: :unprocessable_entity
    end
  end
end
