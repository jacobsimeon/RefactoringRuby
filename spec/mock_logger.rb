class MockLogger
  attr_accessor :messages
  def initialize
    @messages = []
  end

  def archive_candidate(message)
    messages << message
    message
  end
end

