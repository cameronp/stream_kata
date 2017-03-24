defmodule StreamKataTest do
  use ExUnit.Case
  doctest StreamKata

  import Answers.StreamKata
  alias Answers.StreamKata

  #import StreamKata
  #alias StreamKata

  #test "next_number takes a number and returns the next one" do
    #assert next_number(5) == 6
  #end


  #test "next_by_twos takes a number and returns the next one counting by twos" do
    #assert next_by_twos(5) == 7
    #assert next_by_twos(4) == 6
  #end

  #test "next_n_numbers/2 takes a start and a count, and returns a list of the next n numbers" do
    #assert next_n_numbers(5,4) == [5,6,7,8]
  #end

  #test "next_n_numbers/3 takes a start, a function, and a count, so we can count by twos, for example" do
    #assert next_n_numbers(5, 4, &next_number/1) == [5,6,7,8]
    #assert next_n_numbers(5, 4, &next_by_twos/1) == [5,7,9,11]
  #end

  
  #test "next_n_multiples_of_three takes a start, a sequencing function, and a count.  It returns count numbers that are divisible by three" do
    #assert next_n_multiples_of_three(6, &next_by_twos/1, 4) == [6,12,18,24]
  #end

  #test "lets wrap the starting number and the next number function in a struct" do
    #s = %StreamKata{start: 5, next_fun: &next_by_twos/1}
    #assert s.start == 5
    #assert s.next_fun == &next_by_twos/1
  #end

  #test "now lets make a next_n function that can take our struct and a count" do
    #s = %StreamKata{start: 5, next_fun: &next_by_twos/1}
    #assert next_n(s, 5) == [5,7,9,11,13]
    #s2 = %StreamKata{start: 5, next_fun: &next_number/1}
    #assert next_n(s2, 5) == [5,6,7,8,9]
  #end


  #test "actually, lets call that function 'take', you can delete the previous test" do
    #s = %StreamKata{start: 5, next_fun: &next_number/1}
    #assert take(s, 5) == [5,6,7,8,9]
  #end

  
  ##test "let's make a function to create our struct" do
    ##assert build_struct(5, &next_number/1) == %StreamKata{start: 5, next_fun: &next_number/1}
  ##end
  

  #test "actually, let's call that function 'iterate', you can delete the previous test" do
    #assert iterate(5, &next_number/1) == %StreamKata{start: 5, next_fun: &next_number/1}
  #end

  #test "let's write a function take_double, that takes 'count' entries, and doubles them all" do
    #result =
      #iterate(5,&next_number/1)
      #|> take_double(5)

    #assert result == [10,12,14,16,18]
  #end

  #test "now, let's write a version of take_double, 'take_map', that takes a StreamKata, a count, and a function, and takes elements applying the function to each in turn" do

    #result =
      #iterate(5,&next_number/1)
      #|> take_map(fn n -> n * 3 end, 5)

    #assert result == [15,18,21,24,27]
  #end

## it would be better if that mapping function could live inside the 
## StreamKata struct.  Let's move it there, and let's make a function 
## 'map' that adds it to the struct.  Also, let's make our original 
## version of take use the mapping function if it's available

  #test "map"  do
    #result = 
      #iterate(5, &next_number/1)
      #|> map(fn x -> x * 4 end)
      #|> take(5)

    #assert result == [20, 24, 28, 32, 36]
  #end


## We'd like to be able to apply multiple functions to our KataStream.
## Let's make it so that map can be called more than once
##
  #test "calling map more than once" do
    #result = 
      #iterate(5, &next_number/1)
      #|> map(fn x -> x * 4 end)
      #|> map(fn x -> x + 1 end)
      #|> take(5)

    #assert result == [21, 25, 29, 33, 37]
  #end

  

end
