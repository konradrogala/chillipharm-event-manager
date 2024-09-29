# frozen_string_literal: true

require_relative 'event'
require_relative 'organizer_actions'
require_relative 'participant_actions'

@events = []

loop do
  puts '----------------'
  puts 'Are you participant(1) or organizer(2), exit(Q)?'

  user_input = gets.chomp

  case user_input
  when 'Q'
    break
  when '1'
    role = 'participant'
  when '2'
    role = 'organizer'
  else
    role = 'guest'
  end

  @events = OrganizerActions.new(@events).navigation if role == 'organizer'

  @events = ParticipantActions.new(@events).navigation if role == 'participant'

  puts "Hello, #{role}!"
end
