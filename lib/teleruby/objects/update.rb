#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'message'
require_relative 'poll'
require_relative 'poll_answer'
require_relative 'callback_query'
require_relative 'chosen_inline_result'
require_relative 'inline_query'
require_relative 'pre_checkout_query'
require_relative 'shipping_query'

# ===This object represents an incoming update.
class Update
  def initialize(update) # :nodoc:
    @update = update
  end


  # The update's unique identifier. Update identifiers start from a 
  # certain positive number and increase sequentially. This ID becomes
  # especially handy if you're using Webhooks, since it allows you to
  # ignore repeated updates or to restore the correct update sequence,
  # should they get out of order. If there are no new updates for at
  # least a week, then identifier of the next update will be chosen
  # randomly instead of sequentially.
  def update_id
    @update.update_id
  end

  ##
  # New incoming message of any kind — text, photo, sticker, etc else
  # false is returned.
  # returns Message object
  def message
    msg = @update.message
    unless msg.nil?
      return Message.new(msg)
    end

    false
  end

  ##
  # New version of a message that is known to the bot and was edited else
  # false is returned.
  def edited_message
    e_msg = @update.edited_message
    unless e_msg.nil?
      return Message.new(e_msg)
    end

    false
  end

  ##
  # New incoming channel post of any kind — text, photo, sticker, etc else
  # false is returned.
  def channel_post
    c_post = @update.channel_post
    unless c_post.nil?
      return Message.new(c_post)
    end

    false
  end

  ##
  # New version of a channel post that is known to the bot and was edited.
  # else false is returned.
  def edited_channel_post
    e_c_post = @update.edited_channel_post
    unless e_c_post.nil?
      return Message.new(e_c_post)
    end

    false
  end

  ##
  # +Optional.+ New incoming inline query.
  def inline_query
    i_query = @update.inline_query
    unless i_query.nil?
      return InlineQuery.new(i_query)
    end

    false
  end

  ##
  # +Optional.+ The result of an inline query that was chosen by a user
  # and sent to their chat partner. Please see our documentation on the
  # feedback collecting for details on how to enable these updates for
  # your bot.
  def chosen_inline_result
    inline_result = @update.chosen_inline_result
    unless inline_result
      return ChoseInlineResult.new(inline_result)
    end

    false
  end

  ##
  # +Optional+. New incoming callback query. Returns CallBackQuery object
  def callback_query
    qury = @update.callback_query
    unless qury.nil?
      return CallBackQuery.new(qury)
    end

    false
  end

  ##
  # +Optional.+ New incoming shipping query. Only for invoices with
  # flexible price
  def shipping_query
    s_query = @udpate.shipping_query
    unless s_query.nil?
      return ShippingQuery.new(s_query)
    end

    false
  end

  ##
  # +Optional+. New incoming pre-checkout query. Contains full
  # information about checkout
  def pre_checkout_query
    p_c_query = @update.pre_checkout_query
    unless p_C_query.nil?
      return PreCheckoutQuery.new(p_c_query)
    end

    false
  end

  ##
  # +Optional+. New poll state. Bots receive only updates about stopped
  # polls and polls, which are sent by the bot.
  def poll
    pol = @udpate.poll
    unless pol.nil?
      return Poll.new(pol)
    end

    false
  end

  ##
  # New poll state. Bots receive only updates about stopped polls and
  # polls, which are sent by the bot.
  def poll_answer
    p_answer = @update.poll_answer
    unless p_answer.nil?
      return PollAnswer.new(p_answer)
    end

    false
  end

  def msg?
    @update.message ? true : false
  end

  def channel_post?
    @update.channel_post ? true : false
  end

  def edited_msg?
    @update.edited_message ? true : false
  end

  def edited_channel_post?
    @update.edited_channel_post ? true : false
  end

  def inline_query?
    @update.inline_query ? true : false
  end

  def new_state_poll?
    @update.poll ? true : false
  end

  def chosen_inline_result?
    @update.chosen_inline_result ? true : false
  end

  def callback_query?
    @update.callback_query ? true : false
  end

  def shipping_query?
    @update.shipping_query ? true : false
  end

  def pre_checkout_query?
    @update.pre_checkout_query ? true : false
  end

  def poll_answer?
    @update.poll_answer ? true : false
  end
end
