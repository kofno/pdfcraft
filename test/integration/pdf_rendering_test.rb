require 'test_helper'

class PdfRenderingTest < ActionDispatch::IntegrationTest

  test "pdf request sends a pdf as a file" do
    get home_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_equal 'inline; filename="contents.pdf"', headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
  end

  test "pdf renderer uses the specified template" do
    get another_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_equal "inline; filename=\"contents.pdf\"", headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
  end

  test "pdf rendering can use partials" do
    get partials_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_equal "inline; filename=\"contents.pdf\"", headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
  end

  test "pdf rendering can access helpers" do
    get helpers_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_equal "inline; filename=\"contents.pdf\"", headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
  end
end
