class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :logout]
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def logout
    auth_token = nil
    json_response(message: "You have successfully logged out", auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:username, :password)
  end

  def user_params
    params.permit(
      :username,
      :password,
      :password_confirmation
    )
  end
end
