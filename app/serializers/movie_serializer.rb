class MovieSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :title, :overview, :poster_path, :vote_average

  def poster_path
    "https://image.tmdb.org/t/p/w500#{object.poster_path}"
  end

end
