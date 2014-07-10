module Teamwork
  class Client

    module Notebook

      # GET all notebooks
      # This method is a bit different as the response nests notebooks under
      # projects, which itself is an array.  Once the projects are parsed,
      # lets map those and save the notebooks to an array
      # options:
      #   includeContent: Boolean (default false)
      # return: [Teamwork::Thing]
      def get_notebooks(options = {})
        objects_from_response(:get, "notebooks", "projects", options)
          .map { |project| project.notebooks.map { |notebook| Teamwork::Thing.new(notebook) }}.flatten
      end

    end

  end
end