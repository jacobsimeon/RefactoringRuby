class MockLogger
  attr_accessor :messages
  def initialize
    @messages = []
  end

  def log(message)
    messages << message
    message
  end
end

