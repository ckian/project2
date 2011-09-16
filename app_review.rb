#!/usr/bin/env ruby
require 'optparse'
require 'yaml'

a = []
b = []

origin = Dir.getwd

Dir.chdir(ARGV[0])

Dir.glob("*.yml").each do |rr|

  File.open(rr) do |f|

    YAML.load_documents(f) do |d|

      d.each do|g_or_b,content|
        content.each do|content2|

          if g_or_b == "good_apps"
            a << "--><tr><td>#{content2["url"]}</td><td>#{content2["name"]}</td><td>#{content2["note"]}</td></tr><!--"
           else
            b << "--><tr><td>#{content2["url"]}</td><td>#{content2["name"]}</td><td>#{content2["note"]}</td></tr><!--"
          end

        end
      end
    end
  end
end

Dir.chdir(origin)

File.open("app_reviews.html", "w") { |aFile|
  aFile << "<html>\n<body><h2><center>Good Apps</center></h2>\n<table border = 1>"
  aFile << "\n\n<tr>\n<td>URLs</td>\n<td>Applications</td>\n<td>Reviews</td>\n</tr>\n"
  aFile << "<!--#{a.sort.uniq}-->\n\n</table><BR><BR><BR>"
  aFile << "<hr size=4 width=85%><h2><center>Bad Apps</center></h2><table border = 1>"
  aFile << "<!--#{b.sort.uniq}-->\n\n</table>\n</body>\n</html>"
}

puts "Generated app_reviews.html"
