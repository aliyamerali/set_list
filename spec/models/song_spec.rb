require 'rails_helper'

RSpec.describe Song, type: :model do
  # binding.pry
  it {should belong_to :artist}
end
