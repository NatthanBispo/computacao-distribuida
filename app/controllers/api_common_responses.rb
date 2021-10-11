module ApiCommonResponses
  extend ActiveSupport::Concern

  def render_success(data = {})
    render json: data, status: 200
  end

  def render_created(data = {})
    render json: data, status: 201
  end

  def render_unprocessable_entity_error(resource = nil)
    data = verify_errors(resource)
    render json: data, status: 422
  end

  def render_not_found_error
    render json: { status: 404 }, status: :not_found
  end

  def render_unauthorized_error
    render json: { status: 401 }, status: :unauthorized
  end

  private

  def verify_errors(resource)
    { errors: resource }
  end

end
