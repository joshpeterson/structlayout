# frozen_string_literal: true

require 'test_helper'

class DeleteTempFileTests < MiniTest::Test
  def test_ensure_file_is_deleted
    file = Tempfile.new
    path = file.path
    DeleteTempFile.call(path)
    assert(!File.exist?(path))
  end
end
