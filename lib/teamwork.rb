require "teamwork/client"

module Teamwork

  class << self

    attr_accessor :api_key, :subdomain

    def client
      @client ||= Teamwork::Client.new
    end

    def respond_to?(method_name, include_private = false)
      client.respond_to?(method_name, include_private) || super
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end

  end

end