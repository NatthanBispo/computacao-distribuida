module ApiTokenAuthenticatable
  extend ActiveSupport::Concern
  include ApiCommonResponses

  def authenticate_user_from_token!
    user, request_token = find_user_by_headers

    sign_in_matching_user(user, request_token)
  end

  def current_user
    @user
  end

  private

  def sign_in_matching_user(user, request_token)
    if user.present? && user.token_match?(request_token)
      sign_in user, store: false
      @user ||= user
    else
      render_unauthorized_error
    end
  end

  def find_user_by_headers
    request_email = request.headers["HTTP_#{User.name.upcase}_EMAIL"].presence
    request_token = request.headers["HTTP_#{User.name.upcase}_TOKEN"].presence

    user = request_email && User.find_by(email: request_email)
    [user, request_token]
  end

end
