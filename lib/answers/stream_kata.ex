defmodule Answers.StreamKata do
  defstruct start: 0, next_fun: nil, map_fun: nil

  alias Answers.StreamKata

  def next_number(n), do: n + 1

  def next_by_twos(n), do: n + 2

  def next_n_numbers(_start, 0), do: []
  def next_n_numbers(start, count) do
    next = next_number(start)
    [start | next_n_numbers(next, count - 1)]
  end

  def next_n_numbers(_start, 0, _next_fun), do: []
  def next_n_numbers(start, count, next_fun) do
    next = next_fun.(start)
    [start | next_n_numbers(next, count - 1, next_fun)]
  end

  def next_n_multiples_of_three(_start, _next_fun, 0), do: []
  def next_n_multiples_of_three(start, next_fun, count) do
    next = next_fun.(start)
    case rem(start, 3) do
      0 -> [start | next_n_multiples_of_three(next, next_fun, count - 1) ]
      _ -> next_n_multiples_of_three(next, next_fun, count) 
    end
  end

  def take(%StreamKata{}, 0), do: []
  def take(%StreamKata{start: start, next_fun: next} = s, count) do
    [apply_map(s, start) | take(%StreamKata{s | start: next.(start)}, count - 1)]
  end

  def apply_map(%StreamKata{map_fun: nil}, val), do: val
  def apply_map(%StreamKata{map_fun: fun}, val), do: fun.(val)

  def iterate(start, next_fun) do
    %StreamKata{start: start, next_fun: next_fun}
  end

  def take_double(%StreamKata{}, 0), do: []
  def take_double(%StreamKata{start: start, next_fun: next} = s, count) do
    [start * 2 | take_double(%StreamKata{s | start: next.(start)}, count - 1) ]
  end

  def take_map(%StreamKata{}, _fun, 0), do: []
  def take_map(%StreamKata{start: start, next_fun: next} = s, fun, count) do
    [fun.(start) | take_map(%StreamKata{s | start: next.(start)}, fun, count - 1)]
  end

  def map(%StreamKata{map_fun: nil} = s, fun),
    do: %StreamKata{s | map_fun: fun}
  def map(%StreamKata{map_fun: current} = s, new_fun) do
    map_fun = fn x ->
      x |> current.() |> new_fun.()
    end
    %StreamKata{s | map_fun: map_fun}
  end
  


  
end
