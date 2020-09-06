#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'poll_option'
require_relative 'message_entity'

# ===This object contains information about a poll.
class Poll
  def initialize(poll) # :nodoc:
    @poll = poll
    freeze
  end

  # Unique poll identifier.
  def id
    @poll.id
  end

  # Poll question, 1-255 characters.
  def question
    @poll.question
  end

  # Returns array of PollOption s. else false is returned.
  def options
    opt = @poll.options
    unless opt.nil?
      poll_options = []
      opt.each do |o|
        poll_options << PollOption.new(o)
      end
      return poll_options
    end

    false
  end

  # Total number of users that voted in the poll.
  def total_voter_count
    @poll.total_voter_count
  end

  # True, if the poll is closed.
  def closed?
    @poll.is_closed
  end

  # True, if the poll is anonymous.
  def anonymous?
    @poll.is_anonymous
  end

  # Poll type, currently can be "regular" or "quiz"
  def type
    @poll.type
  end

  # +Optional+. 0-based identifier of the correct answer option.
  # Available only for polls in the quiz mode, which are closed, or was
  # sent (not forwarded) by the bot or to the private chat with the bot.
  def correct_option_id
    @poll.correct_option_id
  end

  # +Optional.+ Text that is shown when a user chooses an incorrect answer
  # or taps on the lamp icon in a quiz-style poll, 0-200 characters.
  def explanation
    @poll.explanation
  end

  # +Optional.+ Special entities like *usernames*, *URLs*, bot commands,
  # etc. that appear in the explanation.
  def explanation_entities
    data = @poll.explanation_entities
    unless data.nil?
      explanations = []
      data.each do |exp|
        explanations << MessageEntity.new(exp)
      end
      return explanations
    end

    false
  end

  # +Optional.+ Amount of time in seconds the poll will be active after
  # creation.
  def open_period
    @poll.open_period
  end

  # +Optional.+ Point in time (Unix timestamp) when the poll will be
  # automatically closed.
  def close_date
    @poll.close_date
  end
end
