require 'open3'

class ExecuteLayout
  def self.call(path)
    Dir.chdir('cde-package/cde-root/home/josh/layout') do
      stdout, stderr, status = Open3.capture3("./layout.cde #{path}")
      return strip_filenames(stderr) if status != 0
      return stdout
    end
  end

  def self.strip_filenames(stderr)
    stripped = ''
    stderr.each_line do |line|
      stripped += line.partition(':')[2]
    end
    stripped
  end
end
