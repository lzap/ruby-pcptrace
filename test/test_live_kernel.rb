require File.dirname(__FILE__) + '/test_helper.rb'
require 'pcptrace/kernel'

PCPTrace::setup_kernel(true)

class LiveKernelTest < Test::Unit::TestCase
  def test_transaction
    assert_equal 0, pcp_begin("a_transaction")
    assert_equal 0, pcp_end("a_transaction")
  end

  def test_transaction_abort
    assert_equal 0, pcp_begin("a_transaction")
    assert_equal 0, pcp_abort("a_transaction")
  end

  def test_transaction_block
    assert_equal 2, pcp_measure("a_transaction") { 1 + 1 }
  end

  def test_point
    assert_equal 0, pcp_point("a_point")
  end

  def test_observe
    assert_equal 0, pcp_observe("an_observation")
  end

  def test_counter
    assert_equal 0, pcp_counter("a_counter")
  end
end
