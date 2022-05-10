class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:success] = 'Comment was created!'
    else
      flash[:error] = 'ERROR! Could not create comment!'
    end
    redirect_to "/users/#{post.author.id}/posts/#{post.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
