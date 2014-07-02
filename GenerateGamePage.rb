# 1st arg: Name of game
# 2nd arg: Description of the game
# 3rd arg: Width of swf
# 4th arg: Height of swf

@name = ARGV[0]
@description = ARGV[1]
@width = ARGV[2]
@height = ARGV[3]

def create
  file = File.new("site\\games\\#{internal_name}.html", "w")
  file.puts "<html>"
  file.puts "  <head>"
  file.puts "    <title>Kristian Welsh - #{@name}</title>"
  file.puts "  </head>"
  file.puts "  <body>"
  file.puts "    <h1>Kristian Welsh</h1>"
  file.puts "    <h2>Games</h2>"
  file.puts "    <iframe src=\"..\\navbar.html\" frameborder=\"0\"></iframe>"
  file.puts "    <div>"
  file.puts "      <h3>#{@name}</h3>"
  file.puts "      <embed src=\"#{internal_name}.swf\" width=\"#{@width}px\" height=\"#{@height}px\"></embed>"
  file.puts "      <p>#{@description}</p>"
  file.puts "    </div>"
  file.puts "  </body>"
  file.puts "</html>"
  file.close
end

def internal_name
  @name.downcase.gsub " ", "_"
end
create
