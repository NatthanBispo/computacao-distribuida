class Api::V1::UsersController < ActionController::API
  before_action :authenticate_user!, only: [:teste]

  def create
    user = User.new(email: params[:email], password: params[:password])

    return render json: user, status: :ok if user.save

    render status: :unprocessable_entity
  end

  def teste
    byebug
  end

end
