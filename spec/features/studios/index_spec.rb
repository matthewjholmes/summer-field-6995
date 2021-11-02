require 'rails_helper'

RSpec.describe 'studio index' do
  before do
    @studio1 = Studio.create!(name: "Studio 1", location: "Location 1")
    @movie1 = @studio1.movies.create!(title: "Movie 1", creation_year: 2001, genre: "Genre 1")
    @movie2 = @studio1.movies.create!(title: "Movie 2", creation_year: 2002, genre: "Genre 2")
    @movie3 = @studio1.movies.create!(title: "Movie 3", creation_year: 2003, genre: "Genre 3")
    @studio2 = Studio.create!(name: "Studio 2", location: "Location 2")
    @movie4 = @studio2.movies.create!(title: "Movie 4", creation_year: 2004, genre: "Genre 4")
    @movie5 = @studio2.movies.create!(title: "Movie 5", creation_year: 2005, genre: "Genre 5")
    @movie6 = @studio2.movies.create!(title: "Movie 6", creation_year: 2006, genre: "Genre 6")

    visit studios_path
  end

  it 'when i visit the studio index page' do
    expect(current_path).to eq(studios_path)
  end

  it 'i see each studios name and location' do
    within("#studio-#{@studio1.id}") do
      expect(page).to have_content(@studio1.name)
      expect(page).to have_content(@studio1.location)
    end
    within("#studio-#{@studio2.id}") do
      expect(page).to have_content(@studio2.name)
      expect(page).to have_content(@studio2.location)
    end
  end

  it 'underneath each studio i see title of all its movies' do
    within("#studio-#{@studio1.id}") do
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie2.title)
      expect(page).to have_content(@movie3.title)
    end
  end
end
