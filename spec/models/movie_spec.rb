require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @studio1 = Studio.create(name: "studio01", location: "location01")
    @movie01 = @studio1.movies.create(title: "movie01", year: "2001", genre: "genre1")

    @actor111 = Actor.create(name: "name111", age: 111)
    @actor100 = Actor.create(name: "name100", age: 100)
    @actor110 = Actor.create(name: "name110", age: 110)
    @actor222 = Actor.create(name: "name222", age: 222)


    MovieActor.create(movie_id: @movie01.id, actor_id: @actor111.id)
    MovieActor.create(movie_id: @movie01.id, actor_id: @actor100.id)
    MovieActor.create(movie_id: @movie01.id, actor_id: @actor110.id)

  end


  describe "relationships"do
    it{should belong_to :studio}
    it{should have_many :movie_actors}
    it{should have_many(:actors).through(:movie_actors)}
  end

  it "should return actors youngest to oldest" do

    expect(@movie01.actors_by_age).to eq([@actor100, @actor110, @actor111])

  end

  it "should return average age of actors in movie" do

    expect(@movie01.avg_actor_age).to eq(107)

  end
end
