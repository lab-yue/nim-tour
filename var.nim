var
  x, y: int = 1
  # a comment can occur here too
  a, b, c: string

x = 1_000

echo "a ", a
echo "b ", b
echo "x ", x
echo "y ", y
c = "1"
echo "c ", c

const z = "abc" # the constant x contains the string "abc"

const
  p = 1
  # a comment can occur here too
  q = 2
  t = p + q # computations are possible

let v = t
echo v