require_relative 'event'

loop do
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
    puts "What do you want to do?"
    puts "Create event(1)"
    puts "Exit(Q)"

    user_input = gets.chomp

    if user_input == "1"
      event = Event.new(organizer: "John", name: "Birthday party", participiants: ["Alice", "Bob"])
    elsif user_input == "Q"
      break
    end

    puts event
  end

  puts "Hello, #{role}!"
end
