require 'test_helper'

class HtmlifyOutputTest < MiniTest::Test
  def test_replace_less_than
    assert_match(/.*#include &lt;string.*/, HtmlifyOutput.call('#include <string'))
  end

  def test_replace_greater_than
    assert_match(/.*#include string&gt;.*/, HtmlifyOutput.call('#include string>'))
  end
end
