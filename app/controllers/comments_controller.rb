class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)

    if @comment.save!
      redirect_to @post,
      notice: "Se Guardo el comentario"
    else
      redirect_to @post,
      alert: "No se Guardo el comentario"
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:comment)
    end
end