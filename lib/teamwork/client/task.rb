module Teamwork
  class Client

    module Task

      # GET time entries for the project
      # options:
      #   page: UnsignedInt
      #   fromdate: YYYYMMDD
      #   fromtime: HH:MM
      #   todate: YYYYMMDD
      #   totime: HH:MM
      #   sortorder: (ASC, DESC) (defaults to ascending order by date (oldest to newest))
      # Return [Teamwork::Thing]
      def task_timers(task_id, options)
        objects_from_response(:get, "todo_items/#{task_id}/time_entries", "time-entries", options)
      end


    end

  end
end