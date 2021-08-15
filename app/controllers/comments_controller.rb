class CommentsController < ApplicationController
    before_action :set_post

    def create
        comment = @post.comments.create! comments_param
        CommentsMailer.submitted(comment)
        CommentsChannel.broadcast(comment)
        
        redirect_to @post
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end
        
        def comments_param
            params.required(:comment).permit(:body)
        end
end
