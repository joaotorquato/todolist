class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params)
    @task.list_id = @list.id
    unless @task.save
      @task.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :list_id)
  end
end
