class Api::V1::MoviesController < Api::ApiController
  before_action :authenticate_user_from_token!, except: [:create]
  before_action :api_the_movie

  def fetch_by_name
    render_success(@api.fetch_by_name(params[:name], params[:page]))
  end

  def fetch_popular
    render_success(@api.fetch_popular)
  end

  def my_lists
    render_success({
      is_favorite: current_user.favorite.movies.find_by(api_id: params[:movie_id]).present?,
      is_watched: current_user.watched.movies.find_by(api_id: params[:movie_id]).present?,
      is_watch_later: current_user.watch_later.movies.find_by(api_id: params[:movie_id]).present?
    })
  end

  private

  def api_the_movie
    @api = Movies::TheMovieApiService.new
  end

end

