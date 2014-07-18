# 1st arg: Name
# 2nd arg: Description
# 3rd arg: Width
# 4th arg: Height

@name = ARGV[0]
@description = ARGV[1]
@width = ARGV[2]
@height = ARGV[3]

def destination_file
  "site\\games\\#{internal_name}.html"
end

def remove_past_page
  if File.exists? destination_file then
    File.delete destination_file
  end
end

def create
  File.open "game_template.html", "rb" do |source|
    File.open destination_file, "w" do |destination|
      destination.puts(replace_hooks(source.read()))
    end
  end
end

def internal_name
  @name.downcase.gsub " ", "_"
end

def replace_hooks input
  output = input
  output = output.gsub /%name%/, @name
  output = output.gsub /%internal_name%/, internal_name
  output = output.gsub /%description%/, @description
  output = output.gsub /%width%/, @width
  output = output.gsub /%height%/, @height
  output
end

remove_past_page
create
