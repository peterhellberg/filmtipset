# encoding: utf-8

require "uri"
require "open-uri"
require "json"

require_relative "api/genre"

module Filmtipset
  class Api
    attr_accessor :access_key

    def movie(params = {})
      action 'movie', params, :id
    end

    def person(params = {})
      action 'person', params, :id
    end

    def comment(params = {})
      action 'comment', params, :userkey, :id, :comment
    end

    def imdb(params = {})
      action 'imdb', params, :id
    end

    def list(params = {})
      action 'list', params
    end

    def add_to_list(params = {})
      action 'add-to-list', params, :userkey, :id, :movie
    end

    def recommendations(params = {})
      verify_genre_id(params[:id])

      action 'recommendations', params, :userkey, :id
    end

    def user(params = {})
      action 'user', params, :id
    end

    def user_latest(params = {})
      action 'user-latest', params, :id
    end

    def user_messages(params = {})
      action 'user-messages', params, :userkey
    end

    def message(params = {})
      action 'message', params, :id
    end

    def mark_message_unread(params = {})
      action 'mark-message-unread', params, :id
    end

    def send_message(params = {})
      action 'send-message', params, :userkey, :recipient, :subject, :body
    end

    def grade(params = {})
      verify_grade params[:grade]

      action 'grade', params, :userkey, :id, :grade
    end

    def search(params = {})
      action 'search', params, :id
    end

    private

    def action(name, params, *required)
      access_key_is_required
      verify_required(params, required)

      get params.merge(action: name)
    end

    def get(params = {})
      fetch prepared_uri(params)
    end

    def fetch(uri)
      parse open(uri).read
    rescue OpenURI::HTTPError => e
      raise HTTPError, uri
    end

    def parse(json)
      JSON.parse(json)
    rescue JSON::ParserError => e
      raise JSONError, e
    end

    def prepared_uri(params = {})
      base_uri.tap do |uri|
        uri.query = query_params(params)
      end
    end

    def query_params(params)
      URI.encode_www_form handle_params(params)
    end

    def handle_params(params)
      {
        accesskey: access_key,
        returntype: 'json'
      }.merge(params)
    end

    def base_uri
      URI.parse('http://www.filmtipset.se/api/api.cgi')
    end

    def access_key_is_required
      if access_key.nil? || access_key.empty?
        raise NoAccessKeyError, "You need to provide an access key!"
      end
    end

    def verify_genre_id(id)
      Genre.verify_id(id)
    end

    def verify_grade(rating)
      unless (1..5).include?(rating.to_i)
        raise InvalidGrade, "The grade must be in the range 1-5"
      end
    end

    def verify_required(params, keys)
      keys.each do |key|
        if params[key].to_s.empty?
          raise MissingParameter, "The params must include :#{key}"
        end
      end
    end

    class HTTPError        < StandardError; end
    class JSONError        < StandardError; end
    class NoAccessKeyError < StandardError; end
    class InvalidGrade     < StandardError; end
    class MissingParameter < StandardError; end
  end
end
