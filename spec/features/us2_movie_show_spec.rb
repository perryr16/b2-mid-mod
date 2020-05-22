require 'rails_helper'

describe 'us2 - Movie Index' do
  it "studio index has all studios, under each are their movies" do
    studio1 = Studio.create(name: "studio01", location: "location01")

    movie01 = studio1.movies.create(title: "movie01", year: "2001", genre: "genre1")

    actor111 = Actor.create(name: "name111", age: 111)
    actor100 = Actor.create(name: "name100", age: 100)
    actor110 = Actor.create(name: "name110", age: 110)

    MovieActor.create(movie_id: movie01.id, actor_id: actor111.id)
    MovieActor.create(movie_id: movie01.id, actor_id: actor100.id)
    MovieActor.create(movie_id: movie01.id, actor_id: actor110.id)

    visit "/movies/#{movie01.id}"

    within("#movie-#{movie01.id}")do
      expect(page).to have_content("Title: #{movie01.title}")
      expect(page).to have_content("Creation Year: #{movie01.year}")
      expect(page).to have_content("Genre: #{movie01.genre}")
      expect(page).not_to have_content(actor100.name)
      expect(page).not_to have_content(actor110.age)
    end

    within("#actors")do
      expect(page).to_not have_content("Title: #{movie01.title}")
      expect(page.all('.actor_link')[0]).to have_link(actor100.name)
      expect(page.all('.actor_link')[1]).to have_link(actor110.name)
      expect(page.all('.actor_link')[2]).to have_link(actor111.name)
      expect(page).to have_content("Average Actor Age: #{movie01.avg_actor_age}")
      click_link(actor100.name)
    end
    expect(current_path).to eq("/actors/#{actor100.id}")
  end
end


# Story 2 - MOVIE SHOW - show actors (ordered/avg'd)
# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
