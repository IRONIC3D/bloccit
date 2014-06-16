class CommentsController < ApplicationController
  respond_to :html, :js
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    # @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment =  Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post

    @comment.user = current_user
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was added succefully"
      redirect_to [@topic, @post]
    else
      # puts "*** #{@post.comments.to_yaml}"
      # @comments = @post.comments or pass @post.comment directly
      flash[:error] = "There was an error, please try again later"
      render "posts/show"
      # redirect_to [@topic, @post]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed"
      # redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error, please try again later"
      # render "posts/show"
      # redirect_to [@topic, @post]
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end
end
