class DocPdf < Prawn::Document
  initialize(doc)
    super()
    @doc = doc
    text "Hello"
    # methods
  end 
  # methods
end