class ExecuteLayout
  def self.call(path)
    `./layout #{path}`
  end
end
