class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        
        @comment = @post.comments.build(comment_params)
        
        # @comment_user_id = @post.user_id
        
        # @comment.nickname = @comment_user_id.nickname
        
        if @comment.save
            respond_to do |format|
            format.js 
        end
        else
        
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            respond_to do |format|
                format.js
            end
        end

    end
    
    def _iCotem
     @comment_test=User.find(params[:id]).id
    end

    
    private
    
    def comment_params
        params.require(:comment).permit(:context,:user_id, :nickname)
    end
end
