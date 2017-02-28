class Anemon
   require 'anemone'
   require 'nokogiri'
   require 'open-uri'
   # require 'classifier-reborn'


   def initialize(url)
     @url = url 
   end
  
   def crawler
     Anemone.crawl(@url) do |anemone|
       anemone.on_every_page do |page|
         @urls = []
         @links = page.url
         @urls.push(@links)
       end 
    end
  end

  def scrapper
     @urls.each do |urli|
        html_data = open(urli).read
        nokogiri_object = Nokogiri::HTML(html_data)
        elements = nokogiri_object.xpath("//p")

        elements.each do |element|
          @data = element.text
        end
    end
  end

  def scrapper_file 
    #File.file?(filename) will only return true for files
     #File.exists?(filename) will only return true for directories  watch out
    if File.file?("scrapped.txt")
        File.open("scrapped.txt","w"){ |file| file.write(@data)}
    else
       scrapperFile  = File.new("scrapped.txt","w+")
        File.open("scrapped.txt","w"){ |file| file.write(@data)}
       scrapperFile.close
    end
    @scrap_file = File.readlines("scrapped.txt")
  end

  def uploaded_docs(file_name)
    @upload_docs = File.readlines(file_name)
  end
  
  # def comparative
  #   lsi = ClassifierReborn::LSI.new

  #   @scrap_file.each do |scrap_line|
  #      lsi.add_item scrap_line  
  #   end

  #   @upload_docs.each do |upload_line|
  #     lsi.classify upload_line
  #     lsi.find_related(uploaded_line)

  #   end 
  # endo


  def comparative(file_name)
    @scrap_lines = File.readlines(file_name)

      @upload_docs.each do |upload_doc_line|
        if @scrap_lines.include?(upload_doc_line)
           if File.file?("report.txt") 
               File.open("report.txt" ,"w"){ |file| file.write(upload_doc_line)}
            else
              @reportfile = File.new("report.txt","w+")
               File.open("report.txt","w"){ |file| file.write(upload_doc_line)}
              @reportfile.close
           end
        else
          puts "No instances of plagiarism detected in the application;"
        end
      end 
  end

  def visited_links
    if File.file?("visited.txt")
       File.open("visited.txt","w"){ |file| file.write(@links)}
    else
       @visited = File.new("visited.txt","w")
         File.open("visited.txt","w"){|file| file.write(@links)}
       @visited.close
    end
  end

end