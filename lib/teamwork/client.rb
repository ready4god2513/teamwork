require 'faraday'
require 'faraday_middleware'
require 'json'
Dir[File.dirname(__FILE__) + '/client/*.rb'].each {|file| require file }

module Teamwork

  class Client

    include Teamwork::Client::Account
    include Teamwork::Client::Activity
    include Teamwork::Client::Comment
    include Teamwork::Client::File
    include Teamwork::Client::Message
    include Teamwork::Client::Notebook
    include Teamwork::Client::People
    include Teamwork::Client::Project
    include Teamwork::Client::Task

    def initialize(subdomain, api_key)
      @subdomain, @api_key = subdomain, api_key
    end

    def api_endpoint
      @api_endpoint ||= "http://#{@subdomain}.teamworkpm.net/"
    end

    private

    def objects_from_response(method, path, key, params = nil, format = ".json")
      send(method.to_sym, "#{path}#{format}", params).body[key]. map { |item| Teamwork::Thing.new(item) }
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

    def connection
      @connection ||= Faraday.new api_endpoint do |c|
        c.request :multipart
        c.request :json
        c.request :url_encoded
        c.response :json, content_type: /\bjson$/
        c.adapter :net_http
        c.headers[:cache_control] = 'no-cache'
        c.basic_auth(@api_key, '')
      end
    end

  end

end