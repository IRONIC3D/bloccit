class CommentsController < ApplicationController
  respond_to :html, :js
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    # @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment =  Comment.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new
    @comment.user = current_user
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was added succefully"
      # redirect_to [@topic, @post]
    else
      # puts "*** #{@post.comments.to_yaml}"
      # @comments = @post.comments or pass @post.comment directly
      flash[:error] = "There was an error, please try again later"
      # render "posts/show"
      # redirect_to [@topic, @post]
    end

    respond_with(@comment) do |f|
      f.html { redirect_to[@topic, @post]}
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])
    authorize @comment
    puts "*** START Destroy ***"
    if @comment.destroy
      puts "*** Inside first IF Destroy ***"
      flash[:notice] = "Comment was removed"
      # redirect_to [@topic, @post]
    else
      puts "*** Else Destroy ***"
      flash[:error] = "There was an error, please try again later"
      # render "posts/show"
      # redirect_to [@topic, @post]
    end
    puts "*** Before Respond Destroy ***"
    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
