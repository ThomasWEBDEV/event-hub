require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'peut créer un événement valide' do
    user = User.create!(
      email: 'test@example.com',
      password: 'password'
    )

    event = Event.new(
      title: 'Test Event',
      description: 'Une description',
      event_date: 1.week.from_now,
      location: 'Paris',
      max_participants: 10,
      user: user
    )

    expect(event).to be_valid
  end
end
