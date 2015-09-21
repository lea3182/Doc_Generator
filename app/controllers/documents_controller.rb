class DocumentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
    @document = @user.documents.new(doc_params) 
    pdf = DocPdf.new(@document) 
      @file_name = pdf.file_name            
      @document.doc_pdf_file_name = @file_name
      if @document.save
      
      
      obj = S3_BUCKET.objects["#{@file_name}"]
      obj.write("#{@file_name}")    # Writing @file_name to S3 to test connection but need to send actual PDF
      @document.doc_pdf_file_name = obj.key

      DocMailer.doc_confirmation(@user, @document).deliver_now
      redirect_to user_path(@user, @document), notice: 'Document was successfully created. Email confirmation sent'
    else
      redirect_to root_path, alert: "Document did not save. Please resubmit"
    end
  end

  def show
    @document = Document.find(params[:id])
    @doc_file = @document.doc_pdf_file_name

    # this only renders the new document as a pdf, not actually saved as documents.doc_pdf attachment
    respond_to do |format|
      format.html 
      format.pdf do 
        pdf = DocPdf.new(@document)
       
         send_data pdf.render, type: 'application/pdf', disposition: "inline"
      end
    end
  end

 private

  def doc_params
    params.require(:document).permit(:title, :amount, :interest_rate, :down_payment, :doc_pdf)
  end

end
