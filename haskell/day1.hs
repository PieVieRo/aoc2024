import System.IO
import Data.List

main :: IO ()
main = do
    content <- readFile "../day1.txt"
    let parsed = parseFile content 
    print $ firstHalf parsed
    print $ secondHalf parsed

firstHalf :: [[Int]] -> Int
firstHalf xs =
    let [left, right] = map sort $ transpose xs
    in sum $ map abs $ zipWith (-) left right

secondHalf :: [[Int]] -> Int
secondHalf xs =
    let [left, right] = transpose xs
        countInRight x = length (filter (== x) right)
    in sum [x * countInRight x | x <- left]

parseFile :: String -> [[Int]]
parseFile content =
    map (map read . words) (lines content)
