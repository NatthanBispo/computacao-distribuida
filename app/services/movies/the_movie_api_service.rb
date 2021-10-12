class Movies::TheMovieApiService
  # https://api.themoviedb.org/3/search/movie?api_key=dc5a08930732e2d2edbb5d574285e656&language=pt-Br&query=teste&page=1&include_adult=false
  URL = 'https://api.themoviedb.org/3'.freeze
  API_KEY = 'dc5a08930732e2d2edbb5d574285e656'
  LANGUAGE = 'pt-BR'

  def fetch_by_name(name, page)
    make_request("#{URL}/search/movie?api_key=#{API_KEY}&language=#{LANGUAGE}&query=#{name}&page=#{page}&include_adult=false")
  end

  def fetch_by_id(id)
    make_request("#{URL}/movie/#{id}?api_key=#{API_KEY}&language=#{LANGUAGE}")
  end

  private

  def make_request(url)
    HTTParty.get(url).parsed_response
  end

end
