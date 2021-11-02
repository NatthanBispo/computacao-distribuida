class User < ApplicationRecord
  include TokenAuthenticatable

  has_one :favorite
  has_one :watched
  has_one :watch_later

  after_create :create_watched
  after_create :create_favorite
  after_create :create_watch_later

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
