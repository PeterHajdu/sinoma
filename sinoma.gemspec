Gem::Specification.new do |s|
  s.name        = 'sinoma'
  s.version     = '0.0.1'
  s.date        = '2014-09-03'
  s.summary     = "Simple notification through notify my android."
  s.description = "Sinoma forwards notifications from a named pipe to your android device through nma."
  s.authors     = ["Peter Ferenc Hajdu"]
  s.email       = 'peter.ferenc.hajdu@gmail.com'
  s.files       = ["lib/sinoma.rb", "bin/sinoma"]
  s.homepage    = 'http://github.com/PeterHajdu/sinoma'
  s.license     = 'MIT'
  s.executables << "sinoma"
  s.add_runtime_dependency 'ruby-notify-my-android', '~> 0.4', '>= 0.4.3'
end

