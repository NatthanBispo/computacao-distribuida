class Api::V1::SessionsController < Api::ApiController
  def create
    reponse_handler(Users::SessionService.call(session_params: session_params))
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def reponse_handler(response)
    return render_unprocessable_entity_error(response.error) if response.error.present?

    respond_with response.result, location: '', scope: response.result.refresh_token
  end

end
