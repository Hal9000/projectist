require 'livetext'

@live = Livetext.new
@live.read_variables("config.txt")

p @live.vars
