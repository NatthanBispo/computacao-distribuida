class Movies::TheMovieApiService
  BASE_URL = 'https://api.themoviedb.org/3'.freeze
  API_KEY = Rails.application.credentials.the_movie_key
  LANGUAGE = 'pt-BR'.freeze

  def fetch_by_name(name, page)
    request_list("search/movie", "query=#{name}&page=#{page}&include_adult=false")
  end

  def fetch_by_id(id)
    make_request("movie/#{id}")
  end
  
  def fetch_popular
    request_list("movie/popular")
  end

  private

  def request_list(url, params = nil)
    api_movies = make_request(url, params)

    api_movies["results"] = format_movies(api_movies["results"])

    api_movies
  end

  def make_request(url, params = nil)
    HTTParty.get("#{BASE_URL}/#{url}?api_key=#{API_KEY}&language=#{LANGUAGE}&#{params}").parsed_response
  end

  def format_movies(api_movies)
    movies = api_movies.map do |movie|
      {
        id: movie["id"],
        api_id: movie["id"],
        title: movie["title"],
        imdb_id: movie["imdb_id"],
        overview: movie["overview"],
        vote_average: movie["vote_average"],
        poster_path: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
      }
    end

    movies
  end

end
