require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    group = Group.create(name: 'Cars', icon: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         user_id: user.id)
    Entity.new(name: 'Bugatti', amount: 124, group_id: group.id, user_id: user.id)
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have valid amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
