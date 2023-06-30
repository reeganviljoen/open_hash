# frozen_string_literal: true

require_relative "lib/open_hash"

Gem::Specification.new do |spec|
  spec.name = "open_hash"
  spec.version = OpenHash::VERSION::STRING
  spec.authors = ["Reegan Viljoen"]
  spec.email = ["reeganviljoen@outlook.com"]

  spec.summary = "Hashes with keys and methods!"
  spec.description = "a data structure, similar to a Hash, that allows you to use dot notation to access and assighn key value pairs"
  # spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "debug"
end
