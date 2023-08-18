require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Evah', photo: 'http://photo.url', bio: 'My Bio Fake', posts_counter: 0) }

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it '#posts_counter is greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it '#posts_conter should be an integer' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end

  it '#three_most_recent_posts returns correct value' do
    expect(subject.three_most_recent_posts.length).to be <= 3
  end
end
