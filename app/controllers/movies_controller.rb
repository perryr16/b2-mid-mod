class MoviesController <ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def add_actor
    actor = Actor.find_by(name: params[:name])
    movie = Movie.find(params[:id])
    MovieActor.create(movie_id: movie.id, actor_id: actor.id)
    redirect_to "/movies/#{movie.id}"
  end

end
