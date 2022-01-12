class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    byebug
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :url, :photo)
  end


end
