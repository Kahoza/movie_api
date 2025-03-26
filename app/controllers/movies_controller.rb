class MoviesController < ApplicationController
  def index
    movie_service = MovieService.new
    popular_movies = movie_service.fetch_popular_movies
    render json: popular_movies
  end

  def show
    movie_service = MovieService.new
    movie_details = movie_service.fetch_movie_details(params[:id])
    render json: movie_details
  end
end
