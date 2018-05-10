class NoticesController < ApplicationController
  def index
    @notices = Notice.all
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
    authorize_action_for @notice
    @notice = Notice.find(params[:id]);
    @notice.update_attributes(title: params[:notice][:title], content: params[:notice][:content], deadline: params[:notice][:deadline]);
    redirect_to '/notices'
  end

  def update
    authorize_action_for @notice
  end

  def destroy
    authorize_action_for @notice
  end
end
