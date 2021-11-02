class Movie < ApplicationRecord
  has_and_belongs_to_many :favorites
  has_and_belongs_to_many :watch_laters
  has_and_belongs_to_many :watched

end
