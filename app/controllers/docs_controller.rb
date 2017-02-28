class DocsController < ApplicationController


  def index
  end

  def new
  	@doc  = Doc.new
  end

  def create
  	@doc = current_user.docs.build(doc_params)

  	if @doc.save
  		redirect_to docs_path , notice: "The document #{@doc.name} has been saved"
    else
    	render "new"
    end

  end

  def destroy
  	@doc = Doc.find(params[:id])
  	@doc.destroy

  	redirect_to docs_path, notice: "This document #{@doc.name} has been deleted"
  end

  def history
      if !user_signed_in?
         flash[:danger] = "Please sign in!"
      else
      	@docs = @current_user.docs
      end
  end

  private
	  def doc_params
	    params.require(:doc).permit(:name ,:attachment , current_user.id)
	  end
end
