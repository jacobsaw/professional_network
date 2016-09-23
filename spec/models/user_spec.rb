require 'rails_helper'
RSpec.describe User do
  it 'requires a name' do
    user = User.new(name: '')
    user.valid?
    expect(user.errors[:name].any?).to eq(true)
  end
  it 'requires name to be alphabetical' do
    user = User.new(name: '123456')
    user.valid?
    expect(user.errors[:name].any?).to eq(true)
  end
  it 'requires a description' do
    user = User.new(description: '')
    user.valid?
    expect(user.errors[:name].any?).to eq(true)
  end
end