class CommentsController < ApplicationController
  def create
    puts 'aaaaaaaaaa'
    @post = Post.find(params[:id])
    @comment = current_user.comments.new(params.require(:comment).permit(:text))
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'Comment was created!'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash.now[:alert] = 'ERROR! Could not create comment!'
    end
  end
end
