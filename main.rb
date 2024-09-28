require_relative 'event'

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
    loop do
      puts "----------------"
      puts "What do you want to do?"
      puts "Create event(1)"
      puts "Back(B)"
  
      user_input = gets.chomp
  
      if user_input == "1"
        puts "----------------"
        puts "Enter event name"

        event_name = gets.chomp

        puts "----------------"
        puts "Enter organizer name"

        organizer_name = gets.chomp

        event = Event.new(organizer: organizer_name, name: event_name)
        @events << event

        puts "Event created: #{event.name} by #{event.organizer}"
        
      elsif user_input == "B"
        break
      else
        next
      end
  
      puts @events
    end
  end

  if role == "participant"
    loop do
      puts "----------------"
      puts "What do you want to do?"
      puts "View events(1)"
      puts "Register to event(2)"
      puts "Back(B)"
  
      user_input = gets.chomp
  
      if user_input == "1"
        @events.each_with_index do |event, index|
          puts "(#{index + 1}) #{event.name} by #{event.organizer}" 
        end
      elsif user_input == "2"
        @events.each_with_index do |event, index|
          puts "(#{index + 1}) #{event.name} by #{event.organizer}" 
        end

        puts "----------------"
        puts "Enter event number to register (1-#{@events.size})"

        user_input = gets.chomp

        if user_input.to_i.between?(1, @events.size)
          puts "----------------"
          puts "Enter your name"

          participant_name = gets.chomp

          @events[user_input.to_i - 1].participiants << participant_name

          puts "You have registered to event: #{@events[user_input.to_i - 1]}"
        else
          puts "Event not found"
        end
      elsif user_input == "B"
        break
      else
        next
      end
    end
  end

  puts "Hello, #{role}!"
end
