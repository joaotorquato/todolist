class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params)
    @task.list_id = @list.id
    if @task.save
      flash[:success] = 'Task was created successfuly.'
    else
      @task.errors.full_messages.each do |msg|
        flash[:error] = 'Task ' + msg
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :list_id)
  end
end
