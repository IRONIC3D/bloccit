class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])

    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was added succefully"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error, please try again later"
      redirect_to [@topic, @post]
    end
  end
end
