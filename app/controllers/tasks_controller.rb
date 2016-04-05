class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params)
    @task.list_id = @list.id
    flash[:error] = 'An error has occurred!' unless @task.save
  end

  private

  def task_params
    params.require(:task).permit(:name, :list_id)
  end
end
