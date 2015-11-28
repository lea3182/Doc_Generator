class Document < ActiveRecord::Base
  belongs_to :user
  has_attached_file :doc_pdf

  validates_attachment_content_type :doc_pdf, content_type: "application/pdf"
end

