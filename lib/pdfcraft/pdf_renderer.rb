require 'prawn'

ActionController::Renderers.add :pdf do |filename, options|
  pdf = render_to_string(options)
  send_data pdf, filename: "#{filename}.pdf", disposition: "inline"
end
