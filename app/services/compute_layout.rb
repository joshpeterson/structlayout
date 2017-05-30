class ComputeLayout
  def self.call(input, type)
    output = ''
    begin
      path = CreateTempFile.call(input, type)
      stdout, stderr, status = ExecuteLayout.call(path)
    ensure
      DeleteTempFile.call(path)
    end
    output = FormatError.call(stderr) if status != 0
    output + HtmlifyOutput.call(stdout)
  end
end
