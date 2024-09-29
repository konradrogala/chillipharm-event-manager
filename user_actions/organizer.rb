# frozen_string_literal: true
require_relative 'base'

module UserActions
  class Organizer < ::UserActions::Base
    private

    def show_navigation
      puts '----------------'
      puts 'What do you want to do?'
      puts 'Create event(1)'
      puts 'Show all events(2)'
      puts 'Show participants(3)'
      puts 'Back(B)'
    end

    def follow_navigation(user_input)
      case user_input
      when '1' then create_event
      when '2' then show_all_events
      when '3' then show_participants
      else
        puts 'Invalid option'
      end
    end

    def create_event
      puts '----------------'
      puts 'Enter event name:'

      event_name = gets.chomp

      puts '----------------'
      puts 'Enter organizer name:'

      organizer_name = gets.chomp

      puts '----------------'
      puts 'Enter participants_limit:'

      participants_limit = gets.chomp

      event = Event.new(organizer: organizer_name, name: event_name, participants_limit: participants_limit)
      @existed_events << event

      puts "Event created: #{event.name} by #{event.organizer}, max participants: #{event.participants_limit}"
    end

    def show_participants
      if @existed_events.empty?
        puts '----------------'
        puts 'No events'
      else
        show_all_events

        puts "Enter event number (1-#{@existed_events.size}) to show participants"

        user_input = gets.chomp

        if user_input.to_i.between?(1, @existed_events.size)
          choosen_event = @existed_events[user_input.to_i - 1]
          puts '----------------'
          puts "Participants of event: #{choosen_event.name}, max participants: #{choosen_event.participants_limit}"

          choosen_event.participiants.each_with_index do |participant, index|
            puts "(#{index + 1}) #{participant}"
          end
        else
          puts 'Event not found'
        end
      end
    end
  end
end
