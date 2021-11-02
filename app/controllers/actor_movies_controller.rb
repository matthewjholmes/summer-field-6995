class ActorMoviesController < ApplicationController

  def create
    actor = Actor.find_by(name: params[:name])
    movie = Movie.find(params[:movie_id])
    actor_movie = ActorMovie.new(actor_id: actor.id, movie_id: movie.id)
    if actor_movie.save
      flash[:success] = "Actor added"
      redirect_to movie_path(movie)
    else
      flash[:alert] = "Actor could not be added"
      redirect_to movie_path(movie)
    end
  end
end
