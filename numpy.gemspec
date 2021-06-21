# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "numpy/version"

Gem::Specification.new do |spec|
  spec.name          = "numpy"
  spec.version       = Numpy::VERSION
  spec.authors       = ["Kenta Murata"]
  spec.email         = ["mrkn@mrkn.jp"]

  spec.summary       = %q{Numpy wrapper for Ruby}
  spec.description   = %q{Numpy wrapper for Ruby}
  spec.homepage      = "https://github.com/mrkn/numpy.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pycall", ">= 1.2.0.beta1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "numo-narray"
end
