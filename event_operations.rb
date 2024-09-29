module EventOperations
  def show_all_events
    puts '----------------'

    if @existed_events.empty?
      puts 'No events'
    else
      @existed_events.each_with_index do |event, index|
        puts "(#{index + 1}) #{event.name} by #{event.organizer}, max participants: #{event.participants_limit}"
      end
    end
  end
end
