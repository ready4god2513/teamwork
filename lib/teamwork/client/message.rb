module Teamwork
  class Client

    module Message

      # GET a single message
      # return Teamwork::Thing
      def get_message(id)
        object_from_response(:get, "posts/#{id}", "post")
      end

    end

  end
end