class ParticipantActions
  def initialize(existed_events)
    @existed_events = existed_events
  end

  def navigation
    loop do
      puts "----------------"
      puts "What do you want to do?"
      puts "Show all events(1)"
      puts "Register to event(2)"
      puts "Back(B)"
  
      user_input = gets.chomp
  
      case user_input
      when "1" then show_all_events
      when "2" then register_to_event
      when "B" then break
      else next
      end
    end

    @existed_events
  end

  private

  def show_all_events
    puts "----------------"

    if @existed_events.empty? 
      puts "No events"
    else
      @existed_events.each_with_index do |event, index|
        puts "(#{index + 1}) #{event.name} by #{event.organizer}" 
      end
    end
  end

  def register_to_event
    show_all_events

    puts "----------------"
    puts "Enter event number to register (1-#{@existed_events.size})"

    user_input = gets.chomp

    if user_input.to_i.between?(1,  @existed_events.size)
      puts "----------------"
      puts "Enter your name"

      participant_name = gets.chomp

      @existed_events[user_input.to_i - 1].participiants << participant_name

      puts "You have registered to event: #{ @existed_events[user_input.to_i - 1]}"
    else
      puts "Event not found"
    end
  end
end
