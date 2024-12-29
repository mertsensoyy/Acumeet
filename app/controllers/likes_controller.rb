class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:alert] = "You have already liked this post!"
    end
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(post_id: params[:id], user_id: current_user.id)
    if like
      like.destroy
      redirect_to posts_path, notice: "Post unliked!"
    else
      redirect_to posts_path, alert: "Something went wrong."
    end
  end


  def like_params
    params.require(:like).permit(:post_id)
  end
end
