class Document < ActiveRecord::Base
  belongs_to :user
  validates :title, :amount, :down_payment, :interest_rate, presence: true
  validates :title, length: { maximum: 20 }
  validates :amount, :down_payment, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :interest_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }

  has_attached_file :doc_pdf
  validates_attachment_content_type :doc_pdf, content_type: "application/pdf"
end

