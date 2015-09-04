class DocumentsController < ApplicationController

  def new
    @document = Document.new
    p params
  end

  def create
   @user = current_user
    # @document.create(title: params[:title], user_id: params[:user_id])
    @document = @user.documents.create(params[:document].permit(:title, :text))
    redirect_to user_path(@user)
  end
end
