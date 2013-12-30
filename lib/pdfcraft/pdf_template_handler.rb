require 'action_view/template'

module Pdfcraft

  class PdfHandler

    def call(template)
      require_engine
      "@pdf ||= ::Prawn::Document.new;" +
        template.source + ";" +
        "@pdf.render;"
    end

    private

    def require_engine
      @require_engine = begin
        require 'prawn'
        true
      end
    end
  end

end

ActionView::Template.register_template_handler :pdfcraft, Pdfcraft::PdfHandler.new
