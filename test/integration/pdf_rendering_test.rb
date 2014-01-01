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
    assert_match "I was rendered in a partial", pdf.page(1).text
  end

  test "pdf rendering can access helpers" do
    get helpers_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_equal "inline; filename=\"contents.pdf\"", headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
    assert_match "This string came from a helper", pdf.page(1).text
  end

  test "pdf layout can be set in view" do
    get pdf_layout_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal [0,0,792,612].map(&:to_f), pdf.page(1).attributes[:MediaBox]
  end

  private

  def pdf
    @pdf ||= PDF::Reader.new(StringIO.new(response.body))
  end
end
