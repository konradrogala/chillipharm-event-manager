# frozen_string_literal: true

class Event
  class ParticipantLimitReachedError < StandardError; end

  def initialize(organizer:, name:, participiants: [], participants_limit:)
    @organizer = organizer
    @name = name
    @participiants = participiants
    @participants_limit = participants_limit
  end

  def add_participant(participant)
    if @participiants.size >= @participants_limit
      raise ParticipantLimitReachedError #, "Participant limit of #{@participant_limit} reached."
    end
    @participiants << participant
  end

  attr_reader :organizer, :name, :participiants, :participants_limit
end
