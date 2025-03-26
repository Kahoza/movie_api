class MovieService
  include HTTParty
  base_uri "https://api.themoviedb.org/3"

  def initialize
    @api_key =  ENV["TMDB_API_KEY"]
  end

  def fetch_popular_movies
    response = self.class.get("/movie/popular?api_key=#{@api_key}&language=en-US&page=1")
    parse_response(response)
  end

  def fetch_movie_details(movie_id)
    response = self.class.get("/movie/#{movie_id}?api_key=#{@api_key}&language=en-US")
    parse_response(response)
  end

  def parse_response(response)
    if response.code == 200
      response.parsed_response
    else
      { error: "Failed to fetch data from TMDb" }
    end
  end
end
