class ComputeLayout
  def self.call(input, type)
    output = 'Error'
    begin
      path = CreateTempFile.call(input, type)
      output = ExecuteLayout.call(path)
    ensure
      DeleteTempFile.call(path)
    end
    HtmlifyOutput.call(output)
  end
end
