# frozen_string_literal: true

class ComputeLayout
  def self.call(input, type, flags)
    output = ''
    begin
      path = CreateTempFile.call(input, type)
      stdout, stderr, status = ExecuteLayout.call(path, flags)
    ensure
      DeleteTempFile.call(path)
    end
    output = FormatError.call(stderr) if status != 0
    output + HtmlifyOutput.call(stdout)
  end
end
