require 'pdfcraft/pdf_renderer'
require 'pdfcraft/pdf_template_handler'

module Pdfcraft
  mattr_accessor :variable_name

  def self.variable_name
    @@variable_name ||= 'pdf'
  end
end
