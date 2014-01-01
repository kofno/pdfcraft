require 'action_view/template'
require 'pdfcraft/document'

module Pdfcraft

  class PdfHandler

    def call(template)
      "@pdf ||= ::Pdfcraft::Document.new;" +
        template.source + ";" +
        "@pdf.render;"
    end
  end

end

ActionView::Template.register_template_handler :pdfcraft, Pdfcraft::PdfHandler.new
