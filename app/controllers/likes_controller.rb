class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])

    return if @post.liked?(current_user)

    @like = Like.new(author_id: current_user.id, post_id: @post.id)

    if @like.save
      flash[:success] = 'Post was liked!'
    else
      flash[:error] = 'ERROR! Could not like the post!'
    end
    redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
  end
end
