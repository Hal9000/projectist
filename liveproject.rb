
#  require 'date'
# .libs date

def init_liveproject
  @live = Livetext.new
  @live.read_variables("config.txt")
  # homepage defaults to https://github.com/$gituser/$name + .git ?
  # set authors to [$author] if $author is set?
end

def libs
  args = api.args
  args.each {|name| api.out "require '#{name}'" }
  api.out " "
  api.optional_blank_line
end

def relative
  args = api.args
  args.each {|name| api.out "require_relative '#{name}'" }
  api.out " "
  api.optional_blank_line
end

def name
  name, title = api.args
  api.setvars({name: name, title: title})
end

def initial
  initial = api.data
  api.setvars({initial: initial})
end

def summary
  summary = api.data
  api.setvars({summary: summary})
  @desc ||= summary
end

def desc
  desc = @desc || api.body
  api.setvars({desc: desc})
end

def author
  author = api.data
  api.setvars({author: author})
end

def email
  email = api.data
  api.setvars({email: email})
end

def dirs
  dirs = api.args
  api.setvar(:dirs, dirs)
end

def extra
  extra = api.args
  api.setvar(:extra, extra)
end

def bin
  files = api.args
  api.setvar(:binaries, files)
end

def homepage
  page = api.data
  api.setvar(:homepage, page)
end

def license
  # defaults to config if not called
  # hmm, what if not there either?
  lic = api.data
  api.setvar(:license, lic)
end

def post_install
  text = api.body
  api.setvar(:post_install, text)
end

def deps
  env = api.args.first
  env ||= "prod"
  var = "deps." + env
  text = api.body
  api.setvar(var, text)
end

def repo
  name = api.args.first
  api.setvar(:repo, name)
end

def gem
  name, classname = api.args
  api.setvar(:gem, name)
  api.setvar(:classname, classname)
  # class is for #{classname}::VERSION
end

#   
#   #   s.version = RuneCMS::VERSION
#   #   s.date        = Date.today.strftime("%Y-%m-%d")
#   
#   #  Gem::Specification.new do |s|
#   #    system("rm -f *.gem")
#   #    s.name        = 'runecms'
#   #    s.version     = RuneCMS::VERSION
#   #    s.date        = Date.today.strftime("%Y-%m-%d")
#   #    s.summary     = "Simple static website manager"
#   #    s.description = "A simple static website manager based on Livetext (and Ruby)"
#   #    s.authors     = ["Hal Fulton"]
#   #    s.email       = 'rubyhacker@gmail.com'
#   #    s.executables << "rcms"
#   #    
#   #    # Files...
#   #    main = GemHelper.file_trees("bin", "lib", "examples", "test")
#   #    misc = %w[./README.lt3 ./README.md runecms.gemspec]
#   #  
#   #    s.files       =  main + misc
#   #    s.homepage    = 'https://github.com/Hal9000/runecms'
#   #    s.license     = "Ruby"
#   #    s.post_install_message = "\n  Success! For help, run 'rcms' with no parameters.\n "
#   #  end
#   
#   .gituser Hal9000
#   .github  private
#   
#   .author  Hal Fulton
#   .email   rubyhacker@gmail.com
#   .license Ruby
#   
#   # default ruby version?
#   # where to find gems for hotfix
#   
#   .comment
#   Read global first, then project (overrides)
#   Comments in gemspec: ruby -v, rvm, bundler, rubygems, ...
#   REPL for this?
#   projectist mixin
#   
#   Utilities:
#     - check staleness? README.md, gemspec, Gemfile?, ...
#     - edit global config
#     - edit project
#     - git status
#     - git normal checkin
#     - bump version
#     - rebuild README
#     - build gemspec
#     - build gem (dep ^^)
#     - push gem (dep ^^)
#     - hotfix
#   .end
#   # from global config:
#   #   gituser
#   #   author
#   #   email
#   
#   
#   
#   .repo myrepo
#   .gem  mygem MyClass
#   
#   
