class Api::V1::MoviesController < Api::ApiController
  before_action :authenticate_user_from_token!, except: [:create]
  before_action :api_the_movie

  def fetch_by_name
    render_success(@api.fetch_by_name(params[:name], params[:page]))
  end

  def fetch_popular
    render_success(@api.fetch_popular)
  end

  private

  def api_the_movie
    @api = Movies::TheMovieApiService.new
  end

end

