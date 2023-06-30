# frozen_string_literal: true

class OpenHash < Hash
  def method_missing(method_name, *args, &block)
    if has_key?(method_name)
      self[method_name]
    elsif has_key?(method_name.to_s)
      self[method_name.to_s]
    elsif method_name.to_s.end_with?("=")
      self[method_name.to_s.chomp("=")] = args.first
    else
      super
    end
  end

  def methods
    setter_keys = keys.map { |key| "#{key}=".to_sym }
    super + keys.map(&:to_sym) + setter_keys
  end

  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY  = 0

    STRING = [MAJOR, MINOR, TINY].compact.join(".")
  end
end
