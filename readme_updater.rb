require 'erb'

template = ERB.new File.open("./templates/README_TEMPLATE.md") { |f| f.read }

themes = ''

Dir.glob('./tapes/*.tape').each do |tape|
  theme_name = File.open(tape).read.split("\n")[1].match(/\"(.+)\"/)[1]

  themes << <<-eos
### #{theme_name}
<img alt="Example of changing the theme to #{theme_name}" src="./renders/#{theme_name}.gif" width="600" />
  eos
end

render = template.result(binding)

File.write("README.md", render)
