$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pdfcraft/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pdfcraft"
  s.version     = Pdfcraft::VERSION
  s.authors     = ["Ryan L. Bell"]
  s.email       = ["ryan.l.bell@gmail.com"]
  s.homepage    = "http://github.com/kofno/pdfcraft"
  s.summary     = "Templated PDF generation for Rails"
  s.description = "PDFCraft adds templated rendering of PDF documents to Rails. Now PDF generation of a resource can work just like HTML, XML builders, or JSON."

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "prawn", "~> 0.13"

  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-minitest'

end
