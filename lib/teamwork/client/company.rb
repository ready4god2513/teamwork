module Teamwork
  class Client

    module Company

      # GET a list of companies
      # Return [Teamwork::Thing]
      def get_companies
        objects_from_response(:get, "companies", "companies")
      end

    end

  end
end