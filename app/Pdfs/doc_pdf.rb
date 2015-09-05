class DocPdf < Prawn::Document
  def initialize(doc)
    super()
    @doc = doc
    heading
    doc_info
  end 

  def heading
    text "#{@doc.user.first_name}'s #{@doc.title}"
  end

  def doc_info
    text "Loan Amount: #{@doc.amount}"
    text "Down Payment: #{@doc.down_payment}"
    text "Interest Rate: #{@doc.interest_rate}"
  end
end