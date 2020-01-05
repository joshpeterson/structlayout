# frozen_string_literal: true

require 'open3'

class ExecuteLayout
  def self.call(path, flags)
    Dir.chdir('layout-package') do
      stdout, stderr, status = Open3.capture3(
        { 'LD_LIBRARY_PATH' => '.' },
        "./layout #{path} -isystem usr/include #{flags}"
      )
      return stdout, strip_filenames(stderr), status
    end
  end

  def self.strip_filenames(stderr)
    stripped = ''
    stderr.each_line do |line|
      stripped += if line.include? ':'
                    line.partition(':')[2]
                  else
                    line
                  end
    end
    stripped
  end
end
