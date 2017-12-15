module Main (main) where

count :: Int -> String -> Int
count n []         = n
count n ('(' : xs) = count (succ n) xs
count n (')' : xs) = count (pred n) xs

find :: Int -> Int -> String -> Int
find i n []   = error "invalid input"
find i n (x : xs)
  | n < 0     = i
  | otherwise = find (succ i) (count n [x]) xs

main :: IO ()
main = do
  input <- getLine
  print $ count 0 input
  print $ find 0 0 input
