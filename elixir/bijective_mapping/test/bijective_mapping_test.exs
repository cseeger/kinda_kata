defmodule BijectiveMappingTest do
  use ExUnit.Case
  doctest BijectiveMapping

  describe "encode/1" do
    test "returns the char map as string" do
      assert BijectiveMapping.encode(125) == "cb"
      assert BijectiveMapping.encode(99262) == "zZa"
    end
  end

  describe "alpha_base_mapping/2" do
    test "returns the base62 mapping" do
      assert BijectiveMapping.alpha_base_mapping([], 125) == [2, 1]
      assert BijectiveMapping.alpha_base_mapping([], 99262) == [25, 51, 0]
    end
  end

  describe "alpha_chars/1" do
    test "returns the alpha_char list for the given nums" do
      assert BijectiveMapping.alpha_chars([2, 1]) == ['c', 'b']
      assert BijectiveMapping.alpha_chars([25, 51, 0]) == ['z', 'Z', 'a']
    end
  end

  describe "chars_alpha/1" do
    test "returns the nums for the given alpha_chars" do
      assert BijectiveMapping.chars_alpha(['c', 'b']) == [2, 1]
      assert BijectiveMapping.chars_alpha(['z', 'Z', 'a']) == [25, 51, 0]
    end
  end

  describe "accumulate_decode/2" do
    test "returns the base10 from given base62" do
      assert BijectiveMapping.accumulate_decode([2, 1], 0) == 125
      assert BijectiveMapping.accumulate_decode([25, 51, 0], 0) == 99262
    end
  end
end
