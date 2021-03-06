class DocumentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
    @document = @user.documents.new(doc_params) 
    @document.save
    pdf = DocPdf.new(@document)
    pdf.render_file("#{Rails.root}/public/#{@document.id}.pdf")  
    @document.doc_pdf_file_name = pdf.file_name
    # binding.pry
    if @document.save
      s3 = Aws::S3::Resource.new(
       credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
       region: ENV['AWS_S3_REGION'])

      s3.bucket(ENV['S3_BUCKET']).object(pdf.file_name).upload_file("#{Rails.root}/public/#{@document.id}.pdf")
      File.delete("#{Rails.root}/public/#{@document.id}.pdf")

      DocMailer.doc_confirmation(@user, @document).deliver_now
      redirect_to user_path(@user, @document), notice: 'Document was successfully created. Email confirmation sent'
    else
      redirect_to root_path, alert: "Document did not save. Please resubmit"

    end
  end

  # def show
  #   @document = Document.find(params[:id])

  #   respond_to do |format|
  #     format.html 
  #     format.pdf do 
  #       pdf = DocPdf.new(@document)

  #       send_data pdf.render, type: 'application/pdf', disposition: "inline"
  #     end
  #   end
  # end

  private

  def doc_params
    params.require(:document).permit(:title, :amount, :interest_rate, :down_payment, :doc_pdf)
  end

end
