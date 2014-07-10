require 'faraday'
require 'faraday_middleware'
require 'json'
Dir[File.dirname(__FILE__) + '/client/*.rb'].each {|file| require file }

module Teamwork

  class Client

    include Teamwork::Client::Account
    include Teamwork::Client::Activity
    include Teamwork::Client::Comment
    include Teamwork::Client::Company
    include Teamwork::Client::File
    include Teamwork::Client::Message
    include Teamwork::Client::Notebook
    include Teamwork::Client::People
    include Teamwork::Client::Project
    include Teamwork::Client::Task
    include Teamwork::Client::Timer

    def api_endpoint
      @api_endpoint ||= "http://#{Teamwork.subdomain}.teamworkpm.net/"
    end

    def self.authenticated?
      !Teamwork.subdomain.nil? || !Teamwork.api_key.nil?
    end

    def resources
      %w{links milestones files notebooks tasks}
    end

    private

    def objects_from_response(method, path, key, params = nil, format = ".json")
      res = response(method, path, key, params, format)[key]
      return [] if res.nil?
      res.map { |item| Teamwork::Thing.new(item) }
    end

    def object_from_response(method, path, key, params = nil, format = ".json")
      Teamwork::Thing.new(response(method, path, key, params, format)[key])
    end

    def response(method, path, key, params, format)
      send(method.to_sym, "#{path}#{format}", params).body
    end

    def get(path, params = nil)
      request(:get, path, params)
    end

    def post(path, params = nil)
      request(:post, path, params)
    end

    def put(path, params = nil)
      request(:put, path, params)
    end

    def delete_path(path, params = nil)
      request(:delete, path, params)
    end

    def request(method, path, parameters = {})
      connection.send(method.to_sym, path, parameters).env
    end

    def connection(endpoint = api_endpoint)
      Faraday.new endpoint do |c|
        c.request :multipart
        c.request :json
        c.request :url_encoded
        c.response :json, content_type: /\bjson$/
        c.adapter :net_http
        c.headers[:cache_control] = 'no-cache'
        c.basic_auth(Teamwork.api_key, '')
      end
    end

  end

end