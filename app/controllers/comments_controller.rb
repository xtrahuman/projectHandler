class CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: { comments: @comments }
    end

    def create
        project = Project.find(params[:project_id])
        comment = project.comments.new(comment_params)
        if comment.save
         render json: 'comment created successfully.'.to_json, status: :created
        else
         render json: 'comment could not be created!'.to_json, status: :unprocessable_entity
        end  
    end

    def destroy
        @comment = Comment.find(params.require(:id))
        if @comment.destroy
            render json: 'comment deleted successfully'.to_json, status: :ok
           else
            render json: 'Error deleting comment'.to_json, status: :unprocessable_entity
           end
    end

    def update
        @comment = Comment.find(params.require(:id))
        if @comment.update(comment_params)
            render json: 'comment updated successfully'.to_json, status: :ok
           else
            render json: 'Error updating comment'.to_json, status: :unprocessable_entity
           end
    end

    private 
    def comment_params
        params.require(:comment).permit(:user_id, :message)
    end
end