require_relative 'event'
require_relative 'organizer_actions'
require_relative 'participant_actions'

@events = []

loop do
  puts "----------------"
  puts "Are you participant(1) or organizer(2), exit(Q)?"
  
  user_input = gets.chomp

  if user_input == "Q"
    break
  elsif user_input == "1"
    role = "participant"
  elsif user_input == "2"
    role = "organizer"
  else
    role = "guest"
  end

  if role == "organizer"
    @events = OrganizerActions.new(@events).navigation
  end

  if role == "participant"
    @events = ParticipantActions.new(@events).navigation
  end

  puts "Hello, #{role}!"
end
