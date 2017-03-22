module Anemon
  class Scrapper
    require 'anemone'
    require 'nokogiri'
    require 'open-uri'

    def crawl_and_scrap(url ,user ,doc)

      filename = url.gsub("http://", "").split(".").join("_").strip + ".txt"

      #crawl the web to get information out web pages
          puts "crawling the web..."
         
          Anemone.crawl(url) do |anemone|
            anemone.on_every_page do |page|
              @urls = []
              @urls << page.url
              
            end
          end
      #feed in the urls obtained from the crawl to start scrapping  
          puts "scrapping #{url} for data..."

          data = []

          @urls.each do |urli|
            html_data = open(urli).read
            nokogiri_object = Nokogiri::HTML(html_data)
            elements = nokogiri_object.xpath("//p","//h1","//h2","//h3","//h4","//h5","//h6")

            elements.each do |element|
              data << element.text
            end
          end
        write_to_file(url, data)
        #store_visited_link(url)
        # in ruby the last statement in a method is always the returned value
        # of the particular method
        {:url => url, :content => data , :filename => filename ,:user => user ,:doc => doc}
    end
          
    def check_for_plagiarism(scrapped_file, uploaded_document)
      # user = User.first
      # doc = User.docs.first
      # path = doc.attachment.path
      # Plag.compare('tribiantech_net.txt', path)
      scrapped_data = File.readlines(scrapped_file) #get lines from the scrapped file in an array 
      uploaded_content = File.readlines(uploaded_document) #get uploaded_content in an array
      
      @plagiarised_content = []

      uploaded_content.each do |uploaded_content_lines|
        if scrapped_data.include?(uploaded_content_lines)
          #append plagiarised uploaded lines to the plagiarised_content array
          @plagiarised_content.push(uploaded_content_lines)
        else
             break
        end
      end
      
    end

    private

    def write_to_file(url, data)
      filename = url.gsub("http://", "").split(".").join("_").strip + ".txt"
      #File.file?(filename) will only return true for files
      #File.exists?(filename) will only return true for directories  watch out
      if File.file?(filename)
        File.open(filename,"w"){ |file| file.write(data)}
      else
        scrapped_file  = File.new(filename,"w+")
        File.open(filename,"w"){ |file| file.write(data)}
        scrapped_file.close
      end
      @scrap_file = File.readlines(filename)
    end

    def store_visited_link(url)
      if File.file?("visited_links.txt")
        File.open("visited_links.txt","a"){|file| file.puts(url) }
      else
        @visited = File.new("visited_links.txt","w")
        File.open("visited_links.txt","w"){ |file| file.write(url)}
        @visited.close
      end
    end
  end
end
#plag = Anemon::Scrapper.new
#plag.scrap('http://google.com')
