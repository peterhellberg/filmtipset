# encoding: utf-8

require "forwardable"

require "filmtipset/api"
require "filmtipset/version"

module Filmtipset
  class << self
    extend Forwardable

    def api
      @api ||= Api.new
    end

    def_delegators :api, :access_key=, :movie, :person, :comment,
                   :imdb, :list, :add_to_list, :recommendations,
                   :user, :user_latest, :user_messages, :message,
                   :mark_message_unread, :send_message, :grade, :search
  end
end
