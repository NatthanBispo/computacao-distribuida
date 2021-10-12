class Movies::TheMovieApiService
  # https://api.themoviedb.org/3/search/movie?api_key=dc5a08930732e2d2edbb5d574285e656&language=pt-Br&query=teste&page=1&include_adult=false
  BASE_URL = 'https://api.themoviedb.org/3'.freeze
  API_KEY = 'dc5a08930732e2d2edbb5d574285e656'
  LANGUAGE = 'pt-BR'

  def fetch_by_name(name, page)
    make_request("search/movie", "query=#{name}&page=#{page}&include_adult=false")
  end

  def fetch_by_id(id)
    make_request("movie/#{id}")
  end
  
  def fetch_popular
    make_request("movie/popular")
  end

  private

  def make_request(url, params = nil)
    api_movies = HTTParty.get("#{BASE_URL}/#{url}?api_key=#{API_KEY}&language=#{LANGUAGE}&#{params}").parsed_response

    api_movies["results"] = format_movies(api_movies["results"])

    api_movies
  end

  def format_movies(api_movies)
    movies = api_movies.map do |movie|
      {
        id: movie["id"],
        api_id: movie["id"],
        title: movie["title"],
        overview: movie["overview"],
        poster_path: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
      }
    end

    movies
  end

end
