class OrganizerActions
  def initialize(existed_events)
    @existed_events = existed_events
  end

  def navigation
    loop do
      puts "----------------"
      puts "What do you want to do?"
      puts "Create event(1)"
      puts "Show all events(2)"
      puts "Show participants(3)"
      puts "Back(B)"
  
      user_input = gets.chomp
  
      if user_input == "1"
        puts "----------------"
        puts "Enter event name:"

        event_name = gets.chomp

        puts "----------------"
        puts "Enter organizer name:"

        organizer_name = gets.chomp

        event = Event.new(organizer: organizer_name, name: event_name)
        @existed_events << event

        puts "Event created: #{event.name} by #{event.organizer}"
      elsif user_input == "2"
        puts "----------------"

        @existed_events.each_with_index do |event, index|
          puts "(#{index + 1}) #{event.name} by #{event.organizer}" 
        end
      elsif user_input == "3"
        puts "----------------"

        @existed_events.each_with_index do |event, index|
          puts "(#{index + 1}) #{event.name} by #{event.organizer}" 
        end

        puts "Enter event number (1-#{@existed_events.size}) to show participants"

        user_input = gets.chomp

        if user_input.to_i.between?(1, @existed_events.size)
          puts "----------------"
          puts "Participants of event: #{@existed_events[user_input.to_i - 1]}"

          @existed_events[user_input.to_i - 1].participiants.each_with_index do |participant, index|
            puts "(#{index + 1}) #{participant}"
          end
        else
          puts "Event not found"
        end

      elsif user_input == "B"
        break
      else
        next
      end
    end

    @existed_events
  end
end
