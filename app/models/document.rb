class Document < ActiveRecord::Base
  belongs_to :user

  has_attached_file :doc_pdf,
  :path => "users/:user_id/:class/:filename"

  validates_attachment_content_type :doc_pdf, content_type: "application/pdf"
end

