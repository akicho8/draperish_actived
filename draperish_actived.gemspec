# -*- coding: utf-8 -*-

Gem::Specification.new do |s|
  s.name         = "draperish_actived"
  s.version      = "0.0.1"
  s.author       = "akicho8"
  s.email        = "akicho8@gmail.com"
  s.homepage     = "https://github.com/akicho8/draperish_actived"
  s.summary      = "draperish_actived"
  s.description  = "draperish_actived"
  s.platform     = Gem::Platform::RUBY

  s.files        = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "active_decorator"
end
