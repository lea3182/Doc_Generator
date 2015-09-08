class AddAttachmentDocPdfToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :doc_pdf
    end
  end

  def self.down
    remove_attachment :documents, :doc_pdf
  end
end
