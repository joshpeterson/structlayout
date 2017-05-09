class ExecuteLayout
  def self.call(path)
    `LD_LIBRARY_PATH=. ./layout #{path}`
  end
end
