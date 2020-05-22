require 'rails_helper'

RSpec.describe Actor do
  describe "relationships"do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}

  end

  it "returns actors they have worked with (associates)" do
    studio1 = Studio.create(name: "studio01", location: "location01")

    movie01 = studio1.movies.create(title: "movie01", year: "2001", genre: "genre1")
    movie02 = studio1.movies.create(title: "movie02", year: "2002", genre: "genre1")
    movie03 = studio1.movies.create(title: "movie03", year: "2003", genre: "genre1")
    movie04 = studio1.movies.create(title: "movie04", year: "2004", genre: "genre1")

    actor100 = Actor.create(name: "name100", age: 100)
    actor110 = Actor.create(name: "name110", age: 110)
    actor111 = Actor.create(name: "name111", age: 103)
    actor222 = Actor.create(name: "name222", age: 222)
    actor999 = Actor.create(name: "name999", age: 999)

    MovieActor.create(movie_id: movie01.id, actor_id: actor100.id)
    MovieActor.create(movie_id: movie02.id, actor_id: actor100.id)
    MovieActor.create(movie_id: movie03.id, actor_id: actor100.id)
    MovieActor.create(movie_id: movie01.id, actor_id: actor110.id)
    MovieActor.create(movie_id: movie02.id, actor_id: actor110.id)
    MovieActor.create(movie_id: movie03.id, actor_id: actor111.id)
    MovieActor.create(movie_id: movie02.id, actor_id: actor222.id)
    MovieActor.create(movie_id: movie04.id, actor_id: actor999.id)

    expect(actor100.associates).to eq("name110, name111, name222")
    # expect(actor100.associates.include?("name110")).to eq(true)
    # expect(actor100.associates.include?("name111")).to eq(true)
    # expect(actor100.associates.include?("name222")).to eq(true)
    # expect(actor100.associates.include?("name999")).to eq(false)
  end
end
