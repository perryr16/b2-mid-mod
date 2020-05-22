class MovieActorsController <ApplicationController

  def create
    actor = Actor.find_by(name: params[:name])
    movie = Movie.find(params[:id])

    MovieActor.create(movie_id: movie.id, actor_id: actor.id)

    redirect_to "/movies/#{movie.id}"
  end

end
