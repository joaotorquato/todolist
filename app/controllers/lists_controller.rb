class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.where(user_id: current_user.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :private)
  end
end
