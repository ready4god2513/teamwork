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

      # GET all tasks across all projects
      # options:
      #   filter: (all, anytime, overdue, today, tomorrow, thisweek, within7, within14, within30, within365, nodate, nostartdate, completed)
      #   page: UnsignedInt
      #   pageSize: 250 (the amount of tasks to return per page)
      #   startdate: YYYYMMDD
      #   endDate: YYYYMMDD
      #   updatedAfterDate: YYYYMMDD
      #   showDeleted: Boolean (default false)
      #   includeCompletedTasks: Boolean (default false)
      #   includeCompletedSubtasks: Boolean (default false)
      #   creator-ids: Comma-delimited list of user ids
      #   include: (nodate, nostartdate, noduedate, overdue)
      #   responsible-party-ids (-1 (all assigned), 0 (all unassigned), or specific user ids as a comma-delimited-list)
      #   sort (duedate, startdate, dateadded, priority, project, company)
      #   getSubTasks: Boolean (default true)
      #   nestSubTasks: Boolean (default false)
      #   getFiles: Boolean (default false)
      #   dataSet: String (default full) (options: full, newTaskDefaults)
      #   includeToday: Boolean (default true) (When using the filter option with any of the following options; within7,within14,within30,within365. You can choose to exclude deadlines for today by passing this parameter as false.)
      #   ignore-start-dates: Boolean (default false) (When using the filter option, you can choose to include start dates matching the filtering critera by passing this parameter as true. By default, only due dates are checked against the filter.)
      # Return [Teamwork::Thing]
      def all_tasks(options = {})
        objects_from_response(:get, "tasks", "todo-items", options)
      end

    end

  end
end