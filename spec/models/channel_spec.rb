require 'rails_helper'

describe Channel do
  it 'should have a valid factory' do
    channel = FactoryBot.build(:channel)
    expect(channel).to be_valid
  end
end
