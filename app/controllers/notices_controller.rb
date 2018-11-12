class NoticesController < ApplicationController
  def index
    if params[:search]
      @notices = Notice.search(params[:search])
    else
      @notices = Notice.all
    end
    
  end

  def new
    @notice = Notice.new
  end

  def create
    Notice.create(title: params[:notice][:title], content: params[:notice][:content], deadline: params[:notice][:deadline])
    redirect_to '/notices'
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.update_attributes(title: params[:notice][:title], content: params[:notice][:content], deadline: params[:notice][:deadline])
    redirect_to '/notices'
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to '/notices'
  end
 
end
