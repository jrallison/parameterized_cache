Gem::Specification.new do |s|
  s.name        = "parameterized_cache"
  s.version     = "0.0.1"
  s.authors     = ["John Allison"]
  s.email       = ["jrallison@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Allow dynamic values for fragment caches}
  s.description = %q{Allow dynamic values for fragment caches}

  s.rubyforge_project = "parameterized_cache"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
