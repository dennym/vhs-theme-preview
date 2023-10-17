require 'open-uri'
require 'erb'

file_contents = URI.parse('https://raw.githubusercontent.com/charmbracelet/vhs/main/THEMES.md').open { |f| f.read }
themes = file_contents.scan(/\*\s`([\s\S][^`]+)`/).flatten

themes.each do |t|
  theme_name = t
  theme_name_fs = t.gsub(" ", "")
  template = ERB.new File.open("./templates/template.tape") { |f| f.read }
  render = template.result(binding)

  File.write("tapes/#{theme_name_fs}.tape", render)
end