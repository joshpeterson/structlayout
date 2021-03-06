# frozen_string_literal: true

require 'open3'

class ExecuteLayout
  @@includes = '-Iusr/lib/llvm-9.0/lib/clang/9.0.1/include '\
               '-Iusr/include/c++/7.4.0 '\
               '-Iusr/include/x86_64-linux-gnu/c++/7 '\
               '-Iusr/include/c++/7.4.0/backward '\
               '-Iusr/include/x86_64-linux-gnu '\
               '-Iusr/include'
  def self.call(path, flags)
    Dir.chdir('layout-package') do
      stdout, stderr, status = Open3.capture3(
        { 'LD_LIBRARY_PATH' => '.' },
        "./layout #{path} -nostdlib #{@@includes} #{flags}"
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
