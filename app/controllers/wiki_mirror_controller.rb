class WikiMirrorController < ApplicationController
	
  PREFIX_LINK_MAP = { "SotM_2011_session:_" => "/session/SotM_2011_session:_",
                      "State_Of_The_Map_2011" => "/program/2011",
                      "SotM_2014_session:_" => "/session/",
                      "State_Of_The_Map_2014" => "/program"}
                      
  CACHE_TIME_TO_LIVE = 60 #in seconds
  
  # Display a session page (not the list. An individual session description)
  def sessn
    title = params['title']
    
    @page_title = title.gsub("_", " ")
    
    unless title.include?("SotM_2011_session:_")
      title = "SotM_2014_session:_" + title 
      @page_title = "Session: " + @page_title
    end
    
    content = wiki_mirror(title) #Call the generalised wiki mirroring function
    
    # Remove green box panel if present
    panelStart = "border:solid; border-width:2px; background-color:#E0EEE0; border-color:#666666;\">"
    if content.include?(panelStart)
      content = chompleft(content, panelStart, true)
      content = chompleft(content, "</table>", true)
    end
    
    @mirror_content = content
    render :template => "wiki_mirror/page.html.erb"
  end
  
  
  # Display a session list page
  def program
    @year = params[:year] || "2014"
    content = wiki_mirror("State_Of_The_Map_#{@year}")
    
    # Find whatever the session list section is called on the wiki page, and remove all
    # proceeding and trailing sections from the content
    
    possibleHeadings = ["Sessions", "Sessions list", "Programme", "Program", "Conference Program"]
    
    found = false
    possibleHeadings.each do |heading|
      startheading = "<span class=\"mw-headline\" id=\"" + heading.gsub(" ","_") + "\">#{heading}</span>"
      if content.include?(startheading)
      	content = chompleft(content, startheading, false)
      	found = true
      	@page_title = heading
      end
    end
    
    raise("Missing sessions heading") if found==false
    
    #Look for trailing content to remove.
    #Following after the span there's a h3 tag (or different level) remove it
    raise("expected h tag" + content[2,1]) if content[2,1]!="h"
    
    htag = "<" + content[2,3]
    content = content[5..-1]
    content = chompright(content, htag, false)
    
    # Check for (optional) better things to right trim down to
    content = chompright(content, "<br />\n<br />", false)
    content = chompright(content, "<div style=\"text-align:center; clear:both; border: 2px solid black;\">", false )
    
    @mirror_content = content
    render :template => "wiki_mirror/page.html.erb"
  end
  	  
    	
private

  # Generalised wiki mirror function. We fetch the specified page title
  # and rewrite links according to the PREFIX_LINK_MAP
  def wiki_mirror(title)
    
    # Check this a valid prefix before we do anything else
    # (We're not mirroring the whole wiki)
    valid = false
    PREFIX_LINK_MAP.keys.each do |valid_prefix|
      valid = true if title.include?(valid_prefix)
    end
    raise("Invalid prefix. We're not mirroring that") unless valid
      
    urlTitle = Rack::Utils.escape(title) #URL escaping
    urlTitle.gsub!("%2F", "/")    #Undo URL escaping on slashes
    
    #The URL to scrape:
    @wiki_url = "http://wiki.openstreetmap.org/wiki/#{urlTitle}"
    url = @wiki_url + "?script=harrys-libreconf-SOTM-scraper"
    
    #The file name to cache contents to
    fileTitle = title.gsub("/", "--")
    fileTitle = "home" if fileTitle==""
    
    cacheDir = "/tmp/wikicontentcache"
    `mkdir -p #{cacheDir}`
    
    file = cacheDir + "/" + fileTitle + ".html"
    
    @cache_comment = ""
    
    if !File.exist?(file) or File.zero?(file) or (Time.now - File.stat(file).mtime > CACHE_TIME_TO_LIVE )
     
       puts "Getting from #{url}"
       	
       # Do the HTTP request to scrape wiki content
       uri = URI.parse(url)
       http = Net::HTTP.new(uri.host, uri.port)
       request = Net::HTTP::Get.new(uri.request_uri)
       response = http.request(request)
       raise("Error #{response.code} retreiving wiki content. URL: #{url}") if response.code != "200"
       content = response.body.to_s.force_encoding("UTF-8")
       
       # Save content to cache
       File.open(file, "w+") do |f|
          f.write(content)
       end
       @cache_comment = "Written to cache file '#{file}'"
    else  
       content = File.read(file)
       @cache_comment = "Read from cache file '#{file}' (age: " + (Time.now - File.stat(file).mtime).to_i.to_s + ")"
    end
    puts @cache_comment
    
    #Remove all the wiki head, menus, footer etc:
    content = chompleft(content, "class=\"mw-content-ltr\">", true)
    content = chompright(content,"<div class=\"printfooter\">", true)
    content = chompright(content,"<!-- \nNewPP limit report", true)
    
    #Lose the rel=nofollows. Assume we're spam free and let's give some google love
    content.gsub!(" rel=\"nofollow\"", "")
    
    #Change links to stay here on the scraper, for any link to a wiki pages which we are mirroring
    PREFIX_LINK_MAP.each do |prefix, path|
      content.gsub!(" href=\"/wiki/#{prefix}", " href=\"#{path}")
    end
    
    #All other wiki pages...  link the actual wiki
    content.gsub!(" href=\"/wiki/",    " href=\"http://wiki.openstreetmap.org/wiki/")
    content.gsub!(" href=\"/w/",       " href=\"http://wiki.openstreetmap.org/w/")
    #and deep link images from the wiki
    content.gsub!(" src=\"/w/images/", " src=\"http://wiki.openstreetmap.org/w/images/")
    
    content.gsub!('<div style="width:52px;"><a href="http://wiki.openstreetmap.org/wiki/File:Ambox_warning_pn.svg" class="image" title="Warning"><img alt="Warning" src="http://wiki.openstreetmap.org/w/images/thumb/1/15/Ambox_warning_pn.svg/40px-Ambox_warning_pn.svg.png" width="40" height="34" srcset="/w/images/thumb/1/15/Ambox_warning_pn.svg/60px-Ambox_warning_pn.svg.png 1.5x, /w/images/thumb/1/15/Ambox_warning_pn.svg/80px-Ambox_warning_pn.svg.png 2x" /></a></div>', '<i class="fa fa-warning" style="color:rgba(237, 28, 36, 0.75); font-size:2em; margin:3px;"></i>')
    
    return content
  end     
  
  #Remove everything up to the specified substr
  def chompleft( str, substr, required )
    raise("Missing expected HTML content") if required and not str.include?(substr)
    return str.split(substr,2)[1]
  end
  
  #Remove everything from the end of str searching backwards to the specified substr
  def chompright( str, substr, required )
    raise("Missing expected HTML content") if required and not str.include?(substr)
    return str.split(substr,2)[0]
  end
  
  
end
