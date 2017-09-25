# -*- encoding: utf-8 -*-

require "./lib/version"

Gem::Specification.new do |s|
  s.name = "pcptrace"
  s.version = ::Newt::VERSION

  s.authors = ["Lukas Zapletal"]
  s.summary = "Ruby bindings for pcptrace (pcp_trace library)"
  s.description = "Ruby bindings for PCP tracing library pcp_trace"
  s.homepage = "https://github.com/lzap/ruby-pcptrace"
  s.licenses = ["MIT"]
  s.email = "lzap+rpm@redhat.com"

  s.files = [
    "lib/version.rb",
    "lib/pcptrace/kernel.rb",
    "ext/pcptrace/extconf.rb",
    "ext/pcptrace/pcptrace.c",
    "README.md"
  ]
  s.extensions = ["ext/pcptrace/extconf.rb"]
  s.require_paths = ["lib", "ext"]

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rake-compiler', '~> 0'
end
