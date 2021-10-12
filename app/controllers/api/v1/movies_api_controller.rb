class Api::V1::MoviesApiController < Api::ApiController
  # before_action :authenticate_user_from_token!, except: [:create]
  before_action :api_the_movie

  def fetch_by_name
    render_success(@api.fetch_by_name(params[:name], params[:page]))
  end

  private

  def api_the_movie
    @api = Movies::TheMovieApiService.new
  end

end

