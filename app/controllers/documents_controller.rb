class DocumentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
    @document = @user.documents.new(doc_params) 
    @document.save
    pdf = DocPdf.new(@document) 
    pdf.render_file("#{Rails.root}/public/pdfs/#{@document.id}.pdf")
    @file_name = pdf.file_name    
    p @file_name  
    @document.doc_pdf_file_name = @file_name
  
    if @document.save
      s3 = Aws::S3::Resource.new(
           credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
           region: 'us-west-1')

      s3.bucket(ENV['S3_PRODUCTION_BUCKET']).object(@file_name).upload_file("#{Rails.root}/app/pdfs/#{@document.id}.pdf")
      File.delete("#{Rails.root}/app/pdfs/#{@document.id}.pdf")

      # s3 = Aws::S3::Resource.new(region:'us-west-2')
      # obj = s3.bucket('bucket-name').object('key')
      # obj.upload_file('/path/to/source/file')
      # s3 = Aws::S3::Resource.new(
      #      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
      #      region: 'us-west-1')
      # s3.bucket(ENV['S3_PRODUCTION_BUCKET']).object(@file_name).upload_file("https://s3-us-west-1.amazonaws.com/docgeneratorapp/users/#{@user.id}/documents/#{@document.id}.pdf")
      # File.delete("#{Rails.root}/app/pdfs/#{@document.id}.pdf")

      # DocMailer.doc_confirmation(@user, @document).deliver_now
      redirect_to user_path(@user, @document), notice: 'Document was successfully created. Email confirmation sent'
    else
      redirect_to root_path, alert: "Document did not save. Please resubmit"
    end

  end

  def show
    @document = Document.find(params[:id])

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
