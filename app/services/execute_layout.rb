require 'open3'

class ExecuteLayout
  @@includes = '-Iusr/lib/llvm-5.0/lib/clang/5.0.0/include '\
               '-Iusr/include/c++/7.2.0 '\
               '-Iusr/include/x86_64-linux-gnu/c++/7 '\
               '-Iusr/include/c++/7.2.0/backward '\
               '-Iusr/include/x86_64-linux-gnu '\
               '-Iusr/include'
  def self.call(path, flags)
    Dir.chdir('layout-package') do
      stdout, stderr, status = Open3.capture3(
        { 'LD_LIBRARY_PATH' => '.' },
        "./layout #{path} #{@@includes} #{flags}"
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
