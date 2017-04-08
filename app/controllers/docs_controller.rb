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
  
    doc = current_user.docs.last
    uploaded_document = doc.attachment.path
    @url_to_scrap = doc.url

    #plag = user.plags.last
    #filename = doc.attachment.path.split('/').last


    Plag.crawl_and_scrap(@url_to_scrap, current_user ,doc)

    plag = current_user.plags.last
    filename = plag.filename
    
    Result.check_for_plagiarism(filename , uploaded_document ,current_user ,doc ,plag)
    @result = current_user.results.last


    unless @result.blank?
      flash[:notice] = "plagiarism detected!"
    else
      flash[:notice] = "No plagiarism detected!"
    end
    
  end
  private
  def doc_params
    params.require(:doc).permit(:name ,:url ,:attachment , current_user.id)
  end
end