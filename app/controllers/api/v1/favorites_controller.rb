class Api::V1::FavoritesController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :search_movie, except: [:index]

  def index
    render_success(serialize_resource_list(current_user.favorite.movies, MovieSerializer))
  end

  def add
    current_user.favorite.add(@movie)

    render_success(current_user.favorite&.movies)
  end

  def remove
    current_user.favorite.remove(@movie)

    render_success(current_user.favorite&.movies)
  end

  def handle
    has = current_user.favorite.movies.find_by(id: @movie.id)

    if has.present?
      current_user.favorite.remove(@movie)
    else
      current_user.favorite.add(@movie)
    end

    render_success(current_user.favorite&.movies)
  end

  private

  def search_movie
    @movie = Movies::SearchService.call(movie_id: params[:movie_id]).result
  end

end
