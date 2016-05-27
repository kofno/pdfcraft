require 'action_view/template'
require 'pdfcraft/document'

module Pdfcraft

  class PdfHandler

    def call(template)
      "def #{Pdfcraft.variable_name};" +
        "@#{Pdfcraft.variable_name} ||= ::Pdfcraft::Document.new;" +
      "end unless respond_to?(:#{Pdfcraft.variable_name});" +
      template.source + ";" +
      "#{Pdfcraft.variable_name}.render;"
    end
  end

end

ActionView::Template.register_template_handler :pdfcraft, Pdfcraft::PdfHandler.new
