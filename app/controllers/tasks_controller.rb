class TasksController < ApplicationController
	before_action :wa_githomo 
	before_action :uji_moto, except: [:create]

	def create
		@task = @project.tasks.create(masaku)

		redirect_to @project 
	end

	def destroy
		if @task.destroy 
			flash[:success]= "Task was deleted"
		else
			flash[:error] = "Task was not deleted"
		end
		redirect_to @project
	end

	def complete
		@task.update_attribute(:completed_at, Time.now)
		redirect_to @project, notice: "Task Completed"
	end

	private

	def wa_githomo
		@project = Project.find(params[:project_id])
	end

	def uji_moto
		@task = @project.tasks.find(params[:id])
	end

	def masaku
		params[:task].permit(:content)
	end
end
