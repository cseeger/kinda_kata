defmodule Base62Test do
  use ExUnit.Case

  describe "encode/1" do
    test "returns the base62 encoding string" do
      assert Base62.encode(1) == "b"
      assert Base62.encode(125) == "cb"
      assert Base62.encode(99262) == "zZa"
    end
  end
end
