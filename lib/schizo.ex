defmodule Schizo do
  @moduledoc """
  A nice module that lets you uppercase or unvowel every other word in a sentence
  """

  @doc """
  Uppercases every other word in a sentence. Example:

  iex> Schizo.uppercase("you are silly")
  "you ARE silly"

  """
  def uppercase(words) do
    transform_every_other_word(words, &uppercaser/1)
  end


  @doc """
  Unvowel every other word in a sentence. Example:
  iex> Schizo.unvowel("you are silly boy")
  "you r silly by"

  """
  def unvowel(words) do
    transform_every_other_word(words, &unvoweler/1)
  end

  defp transform_every_other_word(words, transformation) do
    words
    |> String.split(" ")
    |> Enum.with_index
    |> Enum.map(transformation)
    |> Enum.join(" ")
  end

  defp uppercaser(word) do
    transformer(word, &String.upcase/1)
  end

  defp unvoweler(word) do
    transformer(word, fn word -> Regex.replace(~r([aeiou]), word, "") end)
  end

  defp transformer({word, index}, transformation) do
    case rem(index, 2) do
      0 -> word
      _ -> transformation.(word)
    end
  end

end
