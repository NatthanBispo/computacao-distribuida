class Api::V1::WatchLatersController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :search_movie, except: [:index]

  def index
    render_success(serialize_resource_list(current_user.watch_later.movies, MovieSerializer))
  end

  def add
    current_user.watch_later.add(@movie)

    render_success(current_user.watch_later&.movies)
  end

  def remove
    current_user.watch_later.remove(@movie)

    render_success(current_user.watch_later&.movies)
  end

  def handle
    has = current_user.watch_later.movies.find_by(id: @movie.id)

    if has.present?
      current_user.watch_later.remove(@movie)
    else
      current_user.watch_later.add(@movie)
    end

    render_success(current_user.watch_later&.movies)
  end

  private

  def search_movie
    @movie = Movies::SearchService.call(movie_id: params[:movie_id]).result
  end

end
