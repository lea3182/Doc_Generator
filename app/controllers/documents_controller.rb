class DocumentsController < ApplicationController

  def new
    @document = Document.new
    p params
  end

  def create
   @user = current_user
    @document = @user.documents.create(doc_params)
    redirect_to user_path(@user)
  end

  def show
    @doument = Document.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do 
        pdf = DocPdf.new(@document)
        send_data pdf.render, type: 'application/pdf'
      end
    end

  end

 private
  def doc_params
    params.require(:document).permit(:title, :amount, :interest_rate, :down_payment)
  end
end
