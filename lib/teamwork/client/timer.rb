module Teamwork
  class Client

    module Timer

      # GET recent time entries
      # options:
      #   page: UnsignedInt
      #   fromdate: YYYYMMDD
      #   fromtime: HH:MM
      #   todate: YYYYMMDD
      #   totime: HH:MM
      #   sortorder: (ASC, DESC) (defaults to ascending order by date (oldest to newest))
      # Return [Teamwork::Thing]
      def time_entries(options = {})
        objects_from_response(:get, "time_entries", "time-entries", options)
      end


      # GET a single time entry
      # Return Teamwork::Thing
      def time_entry(id)
        object_from_response(:get, "time_entries/#{id}", "time-entry")
      end

      # PUT a single time entry
      # Return Teamwork::Thing
      def update_time_entry(options = {})
        object_from_response(:put, "time_entries/#{id}", "time-entry", "time-entry" => options)
      end

      # DELETE a single time entry
      # Return boolean
      def delete_time_entry(id)
        send(:delete, "time_entries/#{id}")
      end

    end

  end
end