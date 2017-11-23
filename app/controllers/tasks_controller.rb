class TasksController < ApplicationController
	before_action :wa_githomo 

	def create
		@task = @project.tasks.create(masaku)

		redirect_to @project 
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		@task = @project.tasks.find(params[:id])
		if @task.destroy 
			flash[:success]= "Task was deleted"
		else
			flash[:error] = "Task was not deleted"
		end
		redirect_to @project

	end

	private

	def wa_githomo
		@project = Project.find(params[:project_id])
	end

	def masaku
		params[:task].permit(:content)
	end
end
