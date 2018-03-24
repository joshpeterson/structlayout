# frozen_string_literal: true

class CreateTempFile
  def self.call(content, type)
    file = Tempfile.new(['layout', type == 'cpp' ? '.cpp' : '.c'])
    begin
      file.write(content)
    ensure
      file.close
    end
    file.path
  end
end
