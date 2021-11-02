class Api::V1::WatchedsController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :search_movie, except: [:index]

  def index
    render_success(serialize_resource_list(current_user.watched.movies, MovieSerializer))
  end

  def add
    current_user.watched.add(@movie)

    render_success(current_user.watched&.movies)
  end

  def remove
    current_user.watched.remove(@movie)

    render_success(current_user.watched&.movies)
  end

  def handle
    has = current_user.watched.movies.find_by(id: @movie.id)

    if has.present?
      current_user.watched.remove(@movie)
    else
      current_user.watched.add(@movie)
    end

    render_success(current_user.watched&.movies)
  end

  private

  def search_movie
    @movie = Movies::SearchService.call(movie_id: params[:movie_id]).result
  end

end
