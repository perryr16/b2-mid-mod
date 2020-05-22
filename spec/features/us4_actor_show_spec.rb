require 'rails_helper'

describe 'us4 - Movie Index' do
  it "studio index has all studios, under each are their movies" do
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

    visit "/actors/#{actor100.id}"

    within("#actor-#{actor100.id}")do
      expect(page).to have_content("Name: #{actor100.name}")
      expect(page).to have_content("Age: #{actor100.age}")
      expect(page).to_not have_content("Age: #{actor110.name}")
    end
    within("#associates")do
      expect(page).to have_content("Actors #{actor100.name} has worked with:")
      expect(page).to have_content("#{actor110.name}, #{actor111.name}, #{actor222.name}")

    end
    expect(page).to_not have_content(actor999.name)

  end
end

# Story 4 - ACTOR SHOW - list all quniq actors they've worked with
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular
# actor has worked with.
