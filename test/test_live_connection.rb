require File.dirname(__FILE__) + '/test_helper.rb'

class LiveConnectionTest < Test::Unit::TestCase
  def test_transaction
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::begin("a_transaction"))
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::end("a_transaction"))
  end

  def test_transaction_abort
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::begin("a_transaction"))
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::abort("a_transaction"))
  end

  def test_point
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::point("a_point"))
  end

  def test_observe
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::obs("an_observation", 130.513))
  end

  def test_counter
    assert_equal "No error.", PCPTrace::errstr(PCPTrace::counter("a_counter", 150.180))
  end

  def test_errstr
    assert_equal "No error.", PCPTrace::errstr(0)
    assert_equal "Invalid tag name - tag names cannot be NULL", PCPTrace::errstr(-12000)
    assert_equal "IPC protocol failure", PCPTrace::errstr(-12006)
  end
end
