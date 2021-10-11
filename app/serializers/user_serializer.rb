class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :created_at

  def token
    scope[:token] if scope.present?
  end

end
