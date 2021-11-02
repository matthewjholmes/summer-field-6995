require 'rails_helper'

RSpec.describe 'movies show page' do
  before do
    @studio = Studio.create!(name: "Studio 1", location: "Location 1")
    @movie = @studio.movies.create!(title: "Movie 1", creation_year: 2001, genre: "Genre 1")
    @actor1 = @movie.actors.create!(name: "Actor 1", age: 11)
    @actor2 = @movie.actors.create!(name: "Actor 2", age: 22)
    @actor3 = @movie.actors.create!(name: "Actor 3", age: 33)

    visit movie_path(@movie)
  end

  it 'when i visit a movie show page' do
    expect(current_path).to eq(movie_path(@movie))
  end

  it 'i see the title, year, and genre' do
    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end

  it 'i see its actors from youngest to oldest' do 
    expect(@actor1.name).to appear_before(@actor2.name)
    expect(@actor2.name).to appear_before(@actor3.name)
  end

  it 'i see the average age of all the actors' do
    expect(page).to have_content("Average actor age: 22")
  end
end
