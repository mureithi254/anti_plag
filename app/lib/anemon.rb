module Anemon
  class Scrapper
    require 'anemone'
    require 'nokogiri'
    require 'open-uri'
    require 'set'

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

        content = data.join("")
        write_to_file(url, content)
        #store_visited_link(url)
        # in ruby the last statement in a method is always the returned value
        # of the particular method
        {:url => url, :content => content , :filename => filename ,:user => user ,:doc => doc}
    end
          
    def check_for_plagiarism(scrapped_file, uploaded_document ,user ,doc ,plag)
      # user = User.first
      # doc = User.docs.first
      # path = doc.attachment.path
      # Plag.compare('tribiantech_net.txt', path)
      # scrapped_data = File.readlines(scrapped_file) #get lines from the scrapped file in an array 
      # uploaded_content = File.readlines(uploaded_document) #get uploaded_content in an array
      
      # @plagiarised_content = []
      
      # f1 = File.read('makefile.txt').split(/\r?\n/).to_set
      # f2 = File.read('scrapped.txt').split(/\r?\n/).to_set
      # p f1.intersection(f2).to_a

      puts "checking for plagiarism ... "
      
      scrapped_data = File.read(scrapped_file).split(/\r?\n/).to_set
      uploaded_content = File.read(uploaded_document).split(/\r?\n/).to_set
      
      plagiarised_content = scrapped_data.intersection(uploaded_content).to_a
      
      { :plagiarised_content => plagiarised_content }
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
