class DocsController < ApplicationController
  def index
  	@docs = Doc.all
  end

  def new
  	@doc  = Doc.new
  end

  def create
  	@doc = Doc.new(doc_params)

  	if @doc.save
  		redirect_to docs_path , notice: "The resume #{@doc.name} has been saved"
    else
    	render "new"
    end

  end

  def destroy
  	@doc = Doc.find(params[:id])
  	@doc.destroy

  	redirect_to docs_path, notice: "This resume #{@resume.name} has been deleted"
  end

  private
	  def doc_params
	    params.require(:doc).permit(:name ,:attachment)
	  end
end
