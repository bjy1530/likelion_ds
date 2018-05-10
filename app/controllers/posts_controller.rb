class PostsController < ApplicationController
    load_and_authorize_resource

    before_action :authenticate_user!, only: [ :new, :edit, :create, :update, :destroy ]
    before_action :check_ownership, only: [:edit, :update, :destroy]
    def index
       @posts = Post.all 
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |format|
        if @post.save
            format.html { redirect_to @post, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
        else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def edit
        authorize_action_for @post
    end
    
    def update
        authorize_action_for @post
        respond_to do |format|
            if @post.update(post_params)
            format.html { redirect_to @post, notice: 'Post was successfully updated.' }
            format.json { render :show, status: :ok, location: @post }
            else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        authorize_action_for @post
       @post.destroy
        respond_to do |format|
          format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :content, :image, :user_id)
    end
    
     def check_ownership
      @post = Post.find_by(id: params[:id])
      redirect_to root_path if @post.user.id != current_user.id  
    end
end
