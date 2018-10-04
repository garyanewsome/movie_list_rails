require_relative '../rails_helper'

describe 'MovieList' do 
  let(:movie_list) { FactoryBot.create(:movie_list) }

  before :each do
    movie_list
  end

  it 'has a valid factory' do
    expect(movie_list).to be_valid
    expect(movie_list.title).to eq('Star Trek')
    expect(movie_list.description).to eq('All things Spock and Kirk')
  end

  it 'checks movie list initial count' do
    MovieList.count == 0
  end

  it 'creates new movie list' do
    MovieList.count == 0
    MovieList.new title: 'Star Trek 2.0', description: 'Reboots R Us'
    MovieList.count == 1
    MovieList.last.title == 'Star Trek 2.0'
  end

  it 'edits movie list' do
    expect(movie_list.title).to eq('Star Trek')
    expect(movie_list.description).to eq('All things Spock and Kirk')

    movie_list.update_attribute :title, 'OH NO!'
    movie_list.update_attribute :description, 'My new edited description'

    expect(movie_list.title).to eq('OH NO!')
    expect(movie_list.description).to eq('My new edited description')
  end
end
