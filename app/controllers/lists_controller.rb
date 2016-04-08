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

  def public
    @lists = List.where(private: false).where.not(user_id: current_user.id)
  end

  def mark_favorite
    @list = List.find(params[:id])
    if current_user.mark_favorite(@list)
      flash[:success] = 'List was mark as favorite successfuly.'
    else
      flash[:error] = 'An error ocurred!'
    end
    redirect_to :public_lists
  end

  def favorite
    @lists = current_user.favorite_lists
  end

  private

  def list_params
    params.require(:list).permit(:name, :private)
  end
end
