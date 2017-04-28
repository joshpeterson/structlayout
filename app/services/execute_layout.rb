class ExecuteLayout
  def self.call(path)
    `../layout/layout #{path}`
  end
end
