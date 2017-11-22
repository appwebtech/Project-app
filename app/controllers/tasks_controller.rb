class TasksController < ApplicationController
	before_action :wa_githomo 

	def create
		@task = @project.task.create(masaku)

		redirect_to @project 
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def wa_githomo
		@project = Project.find(params[:project_id])
	end

	def masaku
		params[:task].permit(:content)
	end
end
