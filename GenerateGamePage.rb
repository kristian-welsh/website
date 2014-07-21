# 1st arg: Name
# 2nd arg: Description
# 3rd arg: Width
# 4th arg: Height

@name = ARGV[0] 
@internal_name = @name.downcase.gsub " ", "_"
@description = ARGV[1]
@width = ARGV[2]
@height = ARGV[3]

@destination_file = "site\\games\\#{@internal_name}.html"

@keywords = [
  [/%name%/, @name],
  [/%internal_name%/, @internal_name],
  [/%description%/, @description],
  [/%width%/, @width],
  [/%height%/, @height]
]


def remove_past_page
	if File.exists? @destination_file then
		File.delete @destination_file
	end
end

def create
	File.open "game_template.html", "rb" do |source|
		File.open @destination_file, "w" do |destination|
			destination.puts replace_keywords source.read
		end
	end
end

def replace_keywords input
	output = input
  @keywords.each do |keyword_pair|
    output = output.gsub keyword_pair[0], keyword_pair[1]
  end
	output
end

remove_past_page
create
