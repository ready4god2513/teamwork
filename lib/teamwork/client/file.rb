module Teamwork
  class Client

    module File

      # GET a single message
      # return Teamwork::Thing
      def get_file(id)
        object_from_response(:get, "files/#{id}", "file")
      end

    end

  end
end