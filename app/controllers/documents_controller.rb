class DocumentsController < ApplicationController
  
  def new
    @document = Document.new
    p params
  end

  def create

  end
end
