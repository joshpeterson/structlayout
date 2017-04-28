class DeleteTempFile
  def self.call(path)
    File.delete(path)
  end
end
