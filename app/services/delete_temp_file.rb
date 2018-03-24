# frozen_string_literal: true

class DeleteTempFile
  def self.call(path)
    File.delete(path)
  end
end
