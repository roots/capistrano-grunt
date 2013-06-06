# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'capistrano/grunt/version'

Gem::Specification.new do |s|
  s.name          = 'capistrano-grunt'
  s.version       = Capistrano::Grunt::VERSION
  s.authors       = ['Scott Walkinshaw']
  s.email         = ['scott.walkinshaw@gmail.com']
  s.homepage      = 'https://github.com/swalkinshaw/capistrano-grunt'
  s.summary       = %q{Capistrano extension that adds Grunt tasks}
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = %w(lib)

  s.add_dependency 'capistrano', '>= 2.5.5'
end
