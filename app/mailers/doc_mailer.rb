class DocMailer < ApplicationMailer

  def doc_confirmation(user, document)
    @user = user
    @document = document

    mail ({to: @user.email, subject: "New Document Created"})  # this syntax works
  end
end
