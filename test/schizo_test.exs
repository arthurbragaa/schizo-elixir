defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "uppercase does not change the first word" do
    assert Schizo.uppercase("foo") == "foo"
  end

  test "uppercase does change the second word" do
    assert Schizo.uppercase("foo bar") == "foo BAR"
  end

  test "uppercase does change every other word" do
    assert Schizo.uppercase("foo bar who wha") == "foo BAR who WHA"
  end

  test "unvowel does not unvowel first word" do
    assert Schizo.unvowel("foo") == "foo"
  end

  test "unvowel does unvowel the second word" do
    assert Schizo.unvowel("foo bar") == "foo br"
  end

  test "unvowel does unvowel every other word" do
    assert Schizo.unvowel("foo bar who wha") == "foo br who wh"
  end

end
