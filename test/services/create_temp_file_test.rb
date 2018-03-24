# frozen_string_literal: true

require 'test_helper'

class CreateTempFileTest < MiniTest::Test
  def test_returns_a_file_path_with_the_cpp_extension
    path = CreateTempFile.call('unused', 'cpp')
    assert_match(/.*layout.*.cpp$/, path)
  end

  def test_returns_a_file_path_with_the_c_extension
    path = CreateTempFile.call('unused', 'c')
    assert_match(/.*layout.*.c$/, path)
  end

  def test_file_has_the_given_content
    expected_content = 'content'
    path = CreateTempFile.call(expected_content, 'cpp')
    assert_equal(expected_content, File.read(path))
  end
end
