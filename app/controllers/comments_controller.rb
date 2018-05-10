class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        
        @comment = @post.comments.build(comment_params)
        
        # @c_user= @comment.user_id
        
        
        # @c_user_nickname=@c_user.find(nickname: params[:nickname])
        # @comment_user= User.find_by(id:@c_user)
        # @comment.nickname = @comment_user.nickname
        
        
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
    
    def _item
     @comment_test=User.find(params[:id]).id
    end

    
    private
    
    def comment_params
        params.require(:comment).permit(:context,:user_id, :nickname)
    end
end
