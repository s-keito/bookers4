class PostcommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = Postcomment.new(postcomment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    Postcomment.find(params[:id]).destroy
    redirect_to request.referer
  end


  private

  def postcomment_params
    params.require(:postcomment).permit(:comment)
  end
end
