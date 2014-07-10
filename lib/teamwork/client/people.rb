module Teamwork
  class Client

    module People

      # GET all people
      # options:
      #   page: UnsignedInt
      #   pageSize: UnsignedInt (default 50)
      # return: [Teamwork::Thing]
      def get_people(options = {})
        objects_from_response(:get, "people", "people", options)
      end


    end

  end
end