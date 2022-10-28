require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    user = User.create(name: 'Gideon', password: '123456', email: 'gideons@gmail.com')
    Group.new(name: 'Cars', icon: 'https://unsplash.com/photos/F_-0BxGuVvo', user_id: user.id)
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have valid icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
