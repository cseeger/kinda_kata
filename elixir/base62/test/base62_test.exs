defmodule Base62Test do
  use ExUnit.Case

  describe "encode/1" do
    test "returns the base62 encoding string" do
      assert Base62.encode(0) == "a"
      assert Base62.encode(1) == "b"
      assert Base62.encode(125) == "cb"
      assert Base62.encode(99262) == "zZa"
    end
  end

  describe "decode/1" do
    test "returns the char map as string" do
      assert Base62.decode("a") == 0
      assert Base62.decode("b") == 1
      assert Base62.decode("cb") == 125
      assert Base62.decode("zZa") == 99262
    end
  end

  describe "char_indexes/1" do
    test "returns the nums for the given alpha_chars" do
      assert Base62.char_indexes('cb') == [2, 1]
      assert Base62.char_indexes('zZa') == [25, 51, 0]
    end
  end

  describe "accumulate_decode/2" do
    test "returns the base10 from given base62" do
      assert Base62.accumulate_decode([2, 1], 0) == 125
      assert Base62.accumulate_decode([25, 51, 0], 0) == 99262
    end
  end
end
