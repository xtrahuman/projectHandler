class ProjectsController < ApplicationController
    def index
        projects = Project.all
        render json: { projects: projects }
    end

    def show 
        project = Project.find(params[:id])
        render json: { project: project }
    end

    def create
        project = Project.new(project_params)
        if project.save
         render json: 'project created successfully.'.to_json, status: :created
        else
         render json: 'project could not be created!'.to_json, status: :unprocessable_entity
        end  
    end

    def destroy
        project = Project.find(params.require(:id))
        if project.destroy
            render json: 'project deleted successfully'.to_json, status: :ok
           else
            render json: 'Error deleting project'.to_json, status: :unprocessable_entity
           end
    end

    def conversation
        comment = Comment.find_by(project_id: params[:project_id])
        project = Project.find(params[:project_id])
        render json: {status: project.status, comments: comment}
    end

    def update
        project = Project.find(params.require(:id))
        if project.update(project_params)
            render json: 'project updated successfully'.to_json, status: :ok
           else
            render json: 'Error updating project'.to_json, status: :unprocessable_entity
        end
    end

    private 
    def project_params
        params.require(:project).permit(:user_id, :name, :status)
    end
end