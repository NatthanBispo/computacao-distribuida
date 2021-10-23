class Movies::SearchService < BusinessProcess::Base
  needs :movie_id

  steps :find_movie

  def call
    process_steps

    @movie
  end

  private

  def find_movie
    @movie = Movie.find_by(api_id: movie_id)

    create_movie unless @movie.present?
  end

  def create_movie
    movie_parse = Movies::TheMovieApiService.new.fetch_by_id(movie_id)

    @movie = Movie.create(
      api_id: movie_parse["id"],
      title: movie_parse["title"],
      imdb_id: movie_parse["imdb_id"],
      overview: movie_parse["overview"],
      poster_path: movie_parse["poster_path"],
      vote_average: movie_parse["vote_average"]
    )
  end

end
