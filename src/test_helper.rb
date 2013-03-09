require 'minitest/spec'
require 'minitest/autorun'
require "minitest/reporters"
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class MiniTest::Spec
  def self.shared_examples
    @shared_examples ||= {}
  end
end

module Kernel
  def behavior_of(desc, &a_proc)
    MiniTest::Spec.shared_examples[desc] = a_proc
  end

  def must_behave_like(desc)
    behavior = MiniTest::Spec.shared_examples[desc]
    self.instance_exec(&behavior)
  end
end
