require 'pdfcraft/pdf_renderer'
require 'pdfcraft/pdf_template_handler'

module Pdfcraft
  mattr_writer :variable_name

  def self.variable_name
    @@variable_name ||= 'pdf'
  end
end
