class DocPdf < Prawn::Document
  def initialize(doc)
    super()
    @doc = doc
    text "#{@doc.title}"
  end 
end