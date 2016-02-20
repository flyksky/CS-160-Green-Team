class CommentsController < ApplicationController
  
   def new
	@comment = Comment.new
end

def show
	@comment = Comment.find(params[:id])
end

def edit
    @post = Post.find(params[:post_id])
	@comment = Comment.find(params[:id])
end

  def create
   @post = Post.find(params[:post_id])

   if @post.comments.create(comment_params)
     redirect_to @post,
                 notice: 'Comment was successfully created.'
   else 
     redirect_to @post,
                 alert: 'Error creating comment.'
   end
  end

  def update
  @post = Post.find(params[:post_id])

  @comment = Comment.find(params[:id])
  @comment.update(comment_params)
  redirect_to @post
  end

 def destroy
    @post = Post.find(params[:post_id])
    
   @comment = Comment.find(params[:id])
  if @comment.destroy
   redirect_to @post
  else
   redirect_to @post,
      alert: 'Not destroyed.'
end
 end



private

 def comment_params
   params.require(:comment).permit(:author, :body)
  end

end
