require 'test_helper'

class PearlTest < Pearl::TestCase
  def test_respond_to
    assert Pearl.respond_to?(:new, true)
  end

  def test_new
    assert_equal Pearl.new.class, Pearl::Client
  end

  def test_method_missing
  end
end