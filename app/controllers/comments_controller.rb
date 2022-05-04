class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = current_user.comments.new(params.require(:comment).permit(:text))
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'Comment was created!'
    else
      flash[:error] = 'ERROR! Could not create comment!'
    end
    redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
  end
end
