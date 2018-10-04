require_relative '../rails_helper'

describe 'Movie' do 
  let(:movie) { FactoryBot.create(:movie) }

  before :each do
    movie
  end

  it 'has a valid factory' do
    expect(movie).to be_valid
    expect(movie.title).to eq('Buttons!')
    expect(movie.year).to eq(2019)
    expect(movie.poster_url).to eq('buttons.com')
    expect(movie.genre).to eq('Sci-Fi')
    expect(movie.rating).to eq(5)
  end

  it 'checks movie initial count' do
    Movie.count == 0
  end

  it 'creates new movie with full details' do
    Movie.count == 0
    Movie.new title: 'Flash the Cat',
              year: 2018,
              poster_url: 'flashthecat.com',
              genre: 'pets',
              rating: '4'
    Movie.count == 1
    Movie.last.title == 'Flash the Cat'
  end

  it 'creates new movie with minimum details' do
    Movie.count == 0
    Movie.new title: 'Flash the Cat'
    Movie.count == 1
    Movie.last.title == 'Flash the Cat'
  end

  it 'edit movie' do
    expect(movie.title).to eq('Buttons!')
    expect(movie.year).to eq(2019)
    expect(movie.poster_url).to eq('buttons.com')
    expect(movie.genre).to eq('Sci-Fi')
    expect(movie.rating).to eq(5)

    movie.update_attribute :title, 'Mo Buttons!'
    movie.update_attribute :year, 2020
    movie.update_attribute :poster_url, 'buttons-too.com'
    movie.update_attribute :genre, 'Adventure'
    movie.update_attribute :rating, 2

    expect(movie.title).to eq('Mo Buttons!')
    expect(movie.year).to eq(2020)
    expect(movie.poster_url).to eq('buttons-too.com')
    expect(movie.genre).to eq('Adventure')
    expect(movie.rating).to eq(2)
  end
end
