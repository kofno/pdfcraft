require 'test_helper'

class ConfigurationTest < ActionDispatch::IntegrationTest

  test "rendering with a configured pdf variable" do
    get renamed_var_path(format: :pdf)

    assert_equal "Rendered by a renamed var", pdf.page(1).text
  end

  setup do
    Pdfcraft.variable_name = '__pdf__'
  end

  teardown do
    Pdfcraft.variable_name = 'pdf'
  end
end
