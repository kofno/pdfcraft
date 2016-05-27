require 'prawn'
require 'delegate'

module Pdfcraft

  class Document < Delegator

    def initialize
      @pdf_engine = nil
    end

    def page_config! options
      raise EngineAlreadyInitialized, "pdf document has already started rendering" if @pdf_engine.present?
      __setobj__ pdf_engine(options)
    end

    def page_config options
      page_config! options
      true
    rescue EngineAlreadyInitialized
      false
    end

    def __getobj__
      @pdf_engine ||= pdf_engine
    end

    def __setobj__(obj)
      @pdf_engine = obj
    end

    private

    def pdf_engine options={}
      Prawn::Document.new(options)
    end

    class EngineAlreadyInitialized < StandardError; end
  end

end

