require 'rails_helper'

describe 'us2 - Movie Index' do
  it "studio index has all studios, under each are their movies" do
    studio1 = Studio.create(name: "studio01", location: "location01")

    movie01 = studio1.movies.create(title: "movie01", year: "2001", genre: "genre1")

    actor111 = Actor.create(name: "name111", age: 111)
    actor100 = Actor.create(name: "name100", age: 100)
    actor110 = Actor.create(name: "name110", age: 110)
    actor103 = Actor.create(name: "name103", age: 103)

    MovieActor.create(movie_id: movie01.id, actor_id: actor111.id)
    MovieActor.create(movie_id: movie01.id, actor_id: actor100.id)
    MovieActor.create(movie_id: movie01.id, actor_id: actor110.id)

    visit "/movies/#{movie01.id}"

    within("#actors")do
      expect(page.all('.actor_link')[0]).to have_link(actor100.name)
      expect(page.all('.actor_link')[1]).to have_link(actor110.name)
      expect(page.all('.actor_link')[2]).to have_link(actor111.name)
      expect(page).to_not have_content(actor103.name)
      expect(page).to have_content("Average Actor Age: 107")
    end

    within("#add-actor-form")do
      fill_in :name, with: "#{actor103.name}"
      click_button "Add Actor to Movie"
    end

    expect(current_path).to eq("/movies/#{movie01.id}")

    within("#actors")do
      expect(page.all('.actor_link')[0]).to have_link(actor100.name)
      expect(page.all('.actor_link')[1]).to have_link(actor103.name)
      expect(page.all('.actor_link')[2]).to have_link(actor110.name)
      expect(page.all('.actor_link')[3]).to have_link(actor111.name)
      expect(page).to have_content("Average Actor Age: 106")
    end


  end
end

# Story 3 - MOVIE SHOW - FORM - EXISTING actor - redirect back - see actor
# As a visitor,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)
