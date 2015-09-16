class DocumentsController < ApplicationController
  include Prawn::View
 
  def new
    @user = User.find(params[:id])
    @document = @user.Document.new
  end

  def create
    @user = current_user
    @document = @user.documents.new(doc_params)  #create a new document

    if @document.save

      ####### Experiementing ########
   p "8" * 40
   @document.doc_pdf_file_name = "/users/#{@document.user_id}/documents/#{@document.id}.pdf"
  p  @document.doc_pdf_file_name

    # pdf.render_file("#{Rails.root}/users/:user_id/documents/:id.pdf")
     # @document.doc_pdf = File.open("#{Rails.root}/app/users/#{@document.user_id}/documents/#{@document.id}.pdf")

     ####################################

    DocMailer.doc_confirmation(@user, @document).deliver_now
    redirect_to user_path(@user, @document), notice: 'Document was successfully created. Email confirmation sent'
    else
    redirect_to root_path, alert: "Document did not save. Please resubmit"
    end
  end

  def show
    @document = Document.find(params[:id])

    # this only renders the new document as a pdf, not actually saved as documents.doc_pdf attachment
    respond_to do |format|
      format.html 
      format.pdf do 
        pdf = DocPdf.new(@document)

        send_data pdf.render, filename: "#{Rails.root}/users/#{@document.user_id}/documents/#{@document.id}.pdf",  #not sure about this line
                              type: 'application/pdf', 
                              disposition: "inline"
      end

    end
  end

 private

  def doc_params
    params.require(:document).permit(:title, :amount, :interest_rate, :down_payment, :doc_pdf)
  end

end
