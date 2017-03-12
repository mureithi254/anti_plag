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
      @docs = current_user.docs
  end

  def compare
    @user = current_user
    @uploaded_document = @user.docs.last
    @path = @uploaded_document.attachment.path
    
    Plag.scrap("http://tribiantech_net")
    Plag.check_for_plagiarism('tribiantech_net.txt',@path)
  end

  private
  def doc_params
    params.require(:doc).permit(:name ,:url ,:attachment , current_user.id)
  end
end
