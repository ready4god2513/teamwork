module Teamwork
  class Client

    module Project

      # GET the recent activity stream for a given project
      # Return [Teamwork::Thing]
      def project_activity(project_id, options = {})
        objects_from_response(:get, "projects/#{project_id}/latestActivity", "activity", options.merge({maxItems: 50}))
      end

      # GET time entries for the project
      # options:
      #   page: UnsignedInt
      #   fromdate: YYYYMMDD
      #   fromtime: HH:MM
      #   todate: YYYYMMDD
      #   totime: HH:MM
      #   sortorder: (ASC, DESC) (defaults to ascending order by date (oldest to newest))
      # Return [Teamwork::Thing]
      def project_timers(project_id, options = {})
        objects_from_response(:get, "projects/#{project_id}/time_entries", "time-entries", options)
      end

      # GET people on a project
      # params:
      #   project_id: UnsignedInt
      # Return [Teamwork::Thing]
      def project_people(project_id)
        objects_from_response(:get, "projects/#{project_id}/people", "people")
      end

      # GET files on a project
      # Unfortunately the API returns a project with the associated files as a key
      # in the hash. So lets get the files out after.
      # params:
      #   project_id: UnsignedInt
      # Return [Teamwork::Thing]
      def project_files(project_id)
        object_from_response(:get, "projects/#{project_id}/files", "project").files.map { |file| Teamwork::Thing.new(file) }
      end

      # GET messages on a project
      # params:
      #   project_id: UnsignedInt
      # Return [Teamwork::Thing]
      def project_messages(project_id)
        objects_from_response(:get, "projects/#{project_id}/posts", "posts")
      end

      # GET companies on a project
      # params:
      #   project_id: UnsignedInt
      # Return [Teamwork::Thing]
      def project_companies(project_id)
        objects_from_response(:get, "projects/#{project_id}/companies", "people")
      end

      # GET a list of projects
      # Options: 
      #   status: (ALL, ACTIVE, ARCHIVED)
      #   updatedAfterDate: YYYYMMDD
      #   updatedAfterTime: HH:MM
      #   createdAfterDate: YYYYMMDD
      #   createdAfterTime: HH:MM
      #   includePeople: boolean
      #   orderby: (name, companyName, lastActivityDate)
      #   starred: true
      #   page: UnsignedInt
      # Return [Teamwork::Thing]
      def projects(options = {})
        url = options[:starred].nil? ? "projects" : "projects/starred"
        objects_from_response(:get, url, "projects", options)
      end

      # GET a single project
      # Return Teamwork::Thing
      def project(id)
        object_from_response(:get, "project/#{id}", "project")
      end

      # PUT a start to a project
      # Return Boolean
      def toggle_project_star(id, star: true)
        url = star ? "projects/#{id}/star" : "projects/#{id}/unstar"
        object_from_response(:put, url, "project", project: options)
      end


      # POST a new project
      # Return Teamwork::Thing
      def create_project(options = {})
        object_from_response(:post, "projects", "project", project: options)
      end

      # PUT a current project
      # Return Teamwork::Thing
      def update_project(id, options = {})
        object_from_response(:put, "projects/#{id}", "project", project: options)
      end

      # DELETE a current project
      # Return Boolean
      def delete_project(id)
        send(:delete, "projects/#{id}")
      end

    end
    
  end
end