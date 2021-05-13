require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: "Prince")
    @purple = @prince.songs.create!(title: "Purple Rain", length: 452, play_count: 3451)
    @beret = @prince.songs.create!(title: "Raspberry Beret", length: 234, play_count: 4567)
  end

  it 'shows all the titles of the songs for artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"
    # save_and_open_page
    click_on @purple.title
    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 343")
  end
end
