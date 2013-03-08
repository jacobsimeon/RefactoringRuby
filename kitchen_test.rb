require_relative 'test_helper'

behavior_of :math do
  it "adds two numbers" do
    (1 + 1).must_equal 2
  end
end

describe Array do
  must_behave_like :math

  it "can be created with no arguments" do
    Array.new.must_be_instance_of Array
  end

  it "can be created with a specific size" do
    Array.new(10).size.must_equal 10
  end
end
