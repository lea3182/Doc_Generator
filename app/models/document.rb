class Document < ActiveRecord::Base
  belongs_to :user
  has_attached_file :doc_pdf, styles: {:thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  # url: "/documents/:id/:style/:basename.:extension", 
  # path: ":rails_root/public/photos/:id/:style/:basename.:extension" 
  validates_attachment_content_type :doc_pdf, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
end
