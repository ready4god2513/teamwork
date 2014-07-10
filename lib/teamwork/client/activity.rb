module Teamwork
  class Client

    module Activity

      # GET the recent activity stream across all projects
      # Return [Teamwork::Thing]
      def recent_activity(options = {})
        objects_from_response(:get, "latestActivity", "activity", options.merge({maxItems: 60, onlyStarred: false}))
      end

    end

  end
end