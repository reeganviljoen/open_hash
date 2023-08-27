# frozen_string_literal: true

class OpenHash < Hash

  def initialize(hash = {})
    hash.each do |key, value|
      self[key] = value
    end
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.end_with?("?")
      has_key?(method_name.to_s.chomp("?").to_sym) || has_key?(method_name.to_s.chomp("?"))
    elsif has_key?(method_name)
      self[method_name]
    elsif has_key?(method_name.to_s)
      self[method_name.to_s]
    elsif method_name.to_s.end_with?("=")
      self[method_name.to_s.chomp("=").to_sym] = args.first
    else
      super
    end
  end

  def methods
    super + setter_methods + getter_methods + predicate_methods
  end

  module VERSION
    MAJOR = 0
    MINOR = 2
    TINY  = 1

    STRING = [MAJOR, MINOR, TINY].compact.join(".")
  end


  private

  def setter_methods
    keys.map { |key| "#{key}=".to_sym }
  end

  def getter_methods
    keys.map(&:to_sym)
  end

  def predicate_methods
    keys.map { |key| "#{key}?".to_sym }
  end
end

class Hash
  def to_open_hash
    OpenHash.new(self)
  end
end
