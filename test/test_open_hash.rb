# frozen_string_literal: true
require "test_helper"
require "debug"

class TestOpenHash < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::OpenHash::VERSION
  end

  def test_it_gets_keys
    test_hash = OpenHash.new
    test_hash[:test] = "test"
    assert test_hash.test == "test"
  end

  def test_it_gets_keys_with_string
    test_hash = OpenHash.new
    test_hash["test"] = "test"
    assert test_hash.test == "test"
  end

  def test_it_sets_keys
    test_hash = OpenHash.new
    test_hash.test = "test"
    assert test_hash[:test] == "test"
  end

  def test_methods_retruns_keys
    test_hash = OpenHash.new
    test_hash.test = "test"

    assert test_hash.methods.include?(:test)
    assert test_hash.methods.include?(:test=)
  end

  def test_hash_converter
    test_hash = { test: "test" }.to_open_hash
    assert test_hash.test == "test"
  end

  def test_initialzer_with_args
    test_hash = OpenHash.new(test: "test", test2: "test2")
    assert test_hash.test == "test"
    assert test_hash.test2 == "test2"
  end

  def test_predicate_method_when_key_exists
    test_hash = OpenHash.new(test: "test")
    assert test_hash.test?
  end

  def test_predicate_method_when_key_does_not_exist
    test_hash = OpenHash.new(test: "test")
    refute test_hash.test2?
  end
end
