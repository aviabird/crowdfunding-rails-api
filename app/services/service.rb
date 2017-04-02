class Service
  def call(*args)
    self
  end

  def self.call(*args)
    new(*args).call
  end
end