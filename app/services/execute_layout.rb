require 'open3'

class ExecuteLayout
  @@includes = '-I/usr/lib/llvm-5.0/lib/clang/5.0.0/include '\
               '-I/usr/include/c++/7.2.0 '\
               '-I/usr/include/x86_64-linux-gnu/c++/7 '\
               '-I/usr/include/c++/7.2.0/backward '\
               '-I/usr/include/x86_64-linux-gnu '\
               '-I/usr/include'
  def self.call(path, flags)
    Dir.chdir('cde-package/cde-root/home/josh/layout') do
      stdout, stderr, status = Open3.capture3(
        "./layout.cde #{path} #{@@includes} #{flags}"
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
