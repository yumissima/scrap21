
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(URI.open(url).read)
	page.css("td")[7].text
end



def get_all_the_emails(url)

	page= Nokogiri::HTML(URI.open(url))
	final = Array.new

	link = page.css('a[class=lientxt]')

	link.each {|url|
	hashville = Hash.new
	hashville["ville"] = url.text
	hashville["email"] = get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com" + url['href'][1..-1]), final.push(hashville)
		}
	
	
	puts final 


end

def perform

	get_all_the_emails("http://annuaire-des-mairies.com/val-d-oise.html")

end
perform