#!/usr/bin/env ruby



require 'yaml'

a = []
b = []


Dir.glob("*.yml").each do |rr|

File.open(rr) do |f|
 YAML.load_documents(f) do |d|

d.each do|g_or_b,content|
content.each do|content2|

if g_or_b == "good_apps"

a << "<tr><td>#{content2["url"]}</td><td>#{content2["name"]}</td><td>#{content2["note"]}</td></tr>"

else

b << "<tr><td>#{content2["url"]}</td><td>#{content2["name"]}</td><td>#{content2["note"]}</td></tr>"

end


File.open("app_reviews.html", "w") { |aFile|

aFile << "<html>\n<body><h2><center>Good Apps</center></h2>\n<table border = 1>\n\n<tr>\n<td>URLs</td>\n<td>Applications</td>\n<td>Reviews</td>\n</tr>\n"

aFile << "#{a.sort}\n\n</table><BR><BR>"
aFile << "<hr size=4 width=85%><br><BR><h2><center>Bad Apps</center></h2><table border = 1>"

aFile << "#{b.sort}\n\n</table>\n</body>\n</html>"

}

end
end
end
end
puts "Generated app_reviews.html"
end
