require 'rails_helper'

describe 'us1 - Studio Index' do
  it "studio index has all studios, under each are their movies" do
    studio1 = Studio.create(name: "studio01", location: "location01")
    studio2 = Studio.create(name: "studio02", location: "location02")
    studio3 = Studio.create(name: "studio03", location: "location04")

    movie01 = studio1.movies.create(title: "movie01", year: "2001", genre: "genre1")
    movie11 = studio1.movies.create(title: "movie11", year: "2011", genre: "genre2")
    movie02 = studio2.movies.create(title: "movie02", year: "2002", genre: "genre1")
    movie22 = studio2.movies.create(title: "movie22", year: "2022", genre: "genre2")
    movie03 = studio3.movies.create(title: "movie03", year: "2003", genre: "genre1")
    movie33 = studio3.movies.create(title: "movie33", year: "2033", genre: "genre2")

    visit "/studios"

    within("#studio-#{studio1.id}")do
      expect(page).to have_content("Studio: #{studio1.name}")
      expect(page).to have_content("Movies:")
      expect(page).to have_link(movie01.title)
      expect(page).to have_link(movie11.title)
      expect(page).to_not have_link(movie02.title)
      expect(page).to_not have_link(movie33.title)
    end
    within("#studio-#{studio2.id}")do
      expect(page).to have_content("Studio: #{studio2.name}")
      expect(page).to have_content("Movies:")
      expect(page).to have_link(movie02.title)
      expect(page).to have_link(movie22.title)
      expect(page).to_not have_link(movie01.title)
      expect(page).to_not have_link(movie33.title)
    end
    within("#studio-#{studio3.id}")do
      expect(page).to have_content("Studio: #{studio3.name}")
      expect(page).to have_content("Movies:")
      expect(page).to have_link(movie03.title)
      expect(page).to have_link(movie33.title)
      expect(page).to_not have_link(movie01.title)
      expect(page).to_not have_link(movie22.title)
      click_link(movie03.title)
    end
    expect(current_path).to eq("/movies/#{movie03.id}")


  end

end

# Story 1 - STUDIO INDEX - show movies
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
