class DocMailer < ApplicationMailer

  def doc_confirmation(user, document)
    @user = user
    @document = document
  

    mail({to: @user.email, subject: "New Document Confirmation"})  # this syntax works
  end
end


# Gmail is warning me that these emails might be spam, need to fix.
# http://blog.mailgun.com/tips-tricks-avoiding-gmail-spam-filtering-when-using-ruby-on-rails-action-mailer/