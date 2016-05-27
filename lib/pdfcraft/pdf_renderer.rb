require 'prawn'

ActionController::Renderers.add :pdf do |filename, options|
  pdf_data = render_to_string(options)
  send_data(pdf_data, filename: "#{filename}.pdf", disposition: "inline")
end
