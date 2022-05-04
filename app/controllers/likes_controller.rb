class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])

    return if @post.liked?(current_user)

    @like = Like.create(author_id: current_user.id, post_id: @post.id)

    flash[:success] = 'Post was liked!'
    redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
  end
end
