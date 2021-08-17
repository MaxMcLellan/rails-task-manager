class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def create
    @tasks = Task.new(tasks_params)
    @tasks.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    @tasks = Task.find(params[:id])
    @tasks.update(params[:tasks])
    redirect_to tasks_path(@tasks)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:tasks).permit(:title, :details, :completed)
  end
end
