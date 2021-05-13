require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: "Prince")
        @purple = @prince.songs.create!(title: "Purple Rain", length: 452, play_count: 3451)
        @beret = @prince.songs.create!(title: "Raspberry Beret", length: 234, play_count: 4567)
        @beret = @prince.songs.create!(title: "Third", length: 3, play_count: 4567)
      end

      it 'returns the avg song length' do
        expect(@prince.average_song_length.round(2)).to eq(229.67)
      end
    end
  end
end
