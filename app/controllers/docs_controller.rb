class DocsController < ApplicationController
  include Anemon

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
    user = current_user
    doc = user.docs.last
    uploaded_document = doc.attachment.path
    @url_to_scrap = doc.url

    plag = user.plags.last
    filename = plag.filename

    Plag.crawl_and_scrap(@url_to_scrap, user ,doc)
    Result.check_for_plagiarism(filename , uploaded_document ,user ,doc ,plag)
    @results = Result.all

    unless @results.blank?
      flash[:notice] = "No plagiarism detected!"
    else
      flash[:alert] = "plagiarism detected!"
    end
    
  end
  private
  def doc_params
    params.require(:doc).permit(:name ,:url ,:attachment , current_user.id)
  end
end