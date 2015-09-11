# Preview all emails at http://localhost:3000/rails/mailers/doc_mailer
class DocMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/doc_mailer/doc_confirmation
  def doc_confirmation
    DocMailer.doc_confirmation
  end

end
