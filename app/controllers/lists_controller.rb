class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :mark_favorite]

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
    @task = Task.new
  end

  def mark_favorite
    if current_user.mark_favorite(@list)
      flash[:success] = 'List was mark as favorite successfuly.'
    else
      flash[:error] = 'An error ocurred!'
    end
    redirect_to :public_lists
  end

  def index
    @lists = List.where(user_id: current_user.id)
    @title = 'Your Lists'
  end

  def public
    @lists = List.where(private: false).where.not(user_id: current_user.id)
    @title = 'Public Lists'
    render :index
  end

  def favorite
    @lists = current_user.favorite_lists
    @title = 'Your Favorite Lists'
    render :index
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :private)
  end
end
