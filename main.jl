using VegaLite, DataFrames, Query, VegaDatasets

cars = dataset("cars")

cars |> @select(:Acceleration, :Name) |> collect

function foo( data, origin)
  df = data |> @filter(_.Origin==origin) |> DataFrame
  return df |> @vlplot(:point, :Acceleration, :Miles_per_Gallon)
end

p = foo( cars, "USA")

p |> save("foo.png")

# the following can be run separately - it is a random number guessing game

function play_number_guess()

  total_number = 5

  target_number = rand(1:total_number)
  guess = 0

  while guess != target_number
    print("Please guess a number between 1 and ", total_number, ": ")
    guess = parse(Int64, readline())

    if guess != target_number
      println("Guess again !!")
    end
  end
  println("You guessed correctly!")
end







