module Anemon
  class Scrapper
    require 'anemone'
    require 'nokogiri'
    require 'open-uri'

    def scrap(url)

      filename = url.gsub("http://", "").split(".").join("_").strip + ".txt"

      # only scrap pages you havent scrapped yet
      if File.file?(filename)
        puts "This page has already been scrapped"
      else
        puts "scrapping #{url} for data..."
        data = []
        crawl(url).each do |urli|
          html_data = open(urli).read
          nokogiri_object = Nokogiri::HTML(html_data)
          elements = nokogiri_object.xpath("//p")

          elements.each do |element|
            data = element.text
          end
        end
        write_to_file(url, data)
        store_visited_link(url)
      end
    end

    def uploaded_docs(file_name)
      File.readlines(file_name)
    end

    def compare(file_name)
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

    private

    def crawl(url)
      puts "crawling the web..."
      urls = []
      Anemone.crawl(url) do |anemone|
        anemone.on_every_page do |page|
          links = page.url
          urls.push(links)
        end
      end
      # returns urls as an array
      urls
    end

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

#plag.crawl('http://anemone.rubyforge.org')
#plag.scrapped_file('http://anemone.rubyforge.org')

#plag.uploaded_docs("makefile.txt")
#plag.comparative("scrapped.txt")
#plag.visited_links
