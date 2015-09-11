class DocumentsController < ApplicationController

  def new
    @user = User.find(params[:id])
    @document = @user.Document.new
  end

  def create
    @user = current_user
    @document = @user.documents.create(doc_params)
    redirect_to user_path(@user)
  end

  def show
    @document = Document.find(params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = DocPdf.new(@document)

        send_data pdf.render, type: 'application/pdf', 
                              disposition: "inline"
      end
    end
  end

 private

  def doc_params
    params.require(:document).permit(:title, :amount, :interest_rate, :down_payment)
  end

end
