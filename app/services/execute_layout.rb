class ExecuteLayout
  def self.call(path)
    `./cde-package/layout.cde #{path}`
  end
end
