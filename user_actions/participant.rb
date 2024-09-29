# frozen_string_literal: true

require_relative 'base'

module UserActions
  class Participant < ::UserActions::Base
    private

    def show_navigation
      puts '----------------'
      puts 'What do you want to do?'
      puts 'Show all events(1)'
      puts 'Show my events(2)'
      puts 'Register to event(3)'
      puts 'Back(B)'
    end

    def follow_navigation(user_input)
      case user_input
      when '1' then show_all_events
      when '2' then show_my_events
      when '3' then register_to_event
      else
        puts 'Invalid option'
      end
    end

    def show_my_events
      puts '----------------'

      if @existed_events.empty?
        puts 'No events'
      else
        puts 'Enter your name'

        participant_name = gets.chomp

        participant_events = @existed_events.select do |event|
          event.participiants.include?(participant_name)
        end

        puts '----------------'
        if participant_events.empty?
          puts 'You dont have any events'
        else
          participant_events.each_with_index do |event, index|
            puts "(#{index + 1}) #{event.name} by #{event.organizer}"
          end
        end
      end
    end

    def register_to_event
      if @existed_events.empty?
        puts '----------------'
        puts 'No events'
      else
        show_all_events

        puts '----------------'
        puts "Enter event number to register (1-#{@existed_events.size})"

        user_input = gets.chomp

        if user_input.to_i.between?(1, @existed_events.size)
          puts '----------------'
          puts 'Enter your name'

          participant_name = gets.chomp
          choosen_event = @existed_events[user_input.to_i - 1]

          begin
            choosen_event.add_participant(participant_name)

            puts "You have registered to event: #{choosen_event.name} by #{choosen_event.organizer}"
          rescue Event::ParticipantLimitReachedError
            puts 'Participant limit reached'
          end
        else
          puts 'Event not found'
        end
      end
    end
  end
end
