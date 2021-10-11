class Api::V1::UsersController < Api::ApiController
  before_action :authenticate_user_from_token!, except: [:create]

  def create
    user = User.new(email: params[:email], password: params[:password])

    return render_created(user) if user.save

    render_unprocessable_entity_error(user)
  end

  def teste
    byebug
  end

end
