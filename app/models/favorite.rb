class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :movies

  def add(movie)
    movies << movie unless movies.find_by(id: movie.id).present?
  end

  def remove(movie)
    movies.delete(movie)
  end

end
