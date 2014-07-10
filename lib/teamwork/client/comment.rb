module Teamwork
  class Client

    module Comment

      # GET comments for a given resource
      # params:
      #   resource: String (links, milestones, files, notebooks, tasks)
      #   id: UnsignedInt (the id of the resource that you want to get comments on)
      # options:
      #   page: UnsignedInt
      #   pageSize: UnsignedInt (default 50)
      # return: [Teamwork::Thing]
      def get_comments(resource, id, options = {})
        validate_resource(resource)
        objects_from_response(:get, "#{resource}/#{id}/comments", "comments", options)
      end

      # GET a single comment by ID
      # params:
      #   id: UnsignedInt
      # return Teamwork::Thing
      def get_comment(id)
        object_from_response(:get, "comments/#{id}", "comment")
      end

      # POST a new comment
      # params:
      #   resource: String (links, milestones, files, notebooks, tasks)
      #   id: UnsignedInt (the id of the resource that you want to post comments to)
      # options:
      #   body: String
      #   notify: String (who should we notify of this comment?)
      #   ispprivate: Boolean (default false)
      #   pendingFileAttachments: String (see http://developer.teamwork.com/uploadingfiles for more info)
      # return Teamwork::Thing
      def post_comment(resource, id, options)
        validate_resource(resource)
        get_comment(send(:post, "#{resource}/#{id}/comments.json", comment: options).body["commentId"])
      end

      # PUT an update to a comment
      # params:
      #   id: UnsignedInt (the id of the comment that you want update)
      # options:
      #   body: String
      #   notify: String (who should we notify of this comment?)
      #   ispprivate: Boolean (default false)
      #   pendingFileAttachments: String (see http://developer.teamwork.com/uploadingfiles for more info)
      # return Integer (status code)
      def update_comment(id, options)
        send(:put, "comments/#{id}.json", comment: options).status
      end

      # DELETE a comment
      # params:
      #   id: UnsignedInt (the comment id to delete)
      # return Int (status code)
      def delete_comment(id)
        send(:delete, "coments/#{id}")
      end


      private

      def validate_resource(resource)
        raise TypeError, "Valid resources are #{resources.join(", ")}" unless resources.include?(resource)
      end

    end

  end
end