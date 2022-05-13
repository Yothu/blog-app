class CommentsController < ApplicationController
  skip_before_action :check_user
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

  def destroy
    comment = Comment.find(params[:id])
    comment.post.update(comments_counter: comment.post.comments_counter - 1)
    comment.delete
    redirect_to root_path, notice: 'Comment was deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
