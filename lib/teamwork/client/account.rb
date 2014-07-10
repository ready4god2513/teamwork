require 'uri'

module Teamwork
  class Client

    module Account

      # GET the authenticated users's information
      # Return Teamwork::Thing
      def account_info
        object_from_response(:get, "account", "account")
      end

      # GET an authenticated user
      # This part is unique to the rest of the lib
      # in that it uses a different path for the API call.
      # What we can get from this, however, is the subdomain that the
      # user is a part of and store that for future API calls.
      # http://authenticate.teamworkpm.net/authenticate.json
      # Return Teamwork::Thing (or 401 if auth fails)
      def authenticate(api_key)
        Teamwork.api_key = api_key
        result = connection("http://authenticate.teamworkpm.net").send(:get, "authenticate.json").env
        return result.status if result.status == 401

        thing = Thing.new(result.body["account"])
        Teamwork.subdomain = thing.code
        thing
      end

    end

  end
end