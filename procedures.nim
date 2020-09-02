proc ask(question: string): bool =
  echo question, " (y/n)"
  while true:
    case readLine(stdin)
    of "y", "Y", "yes", "Yes": return true
    of "n", "N", "no", "No": return false
    else: echo "Please be clear: yes or no"

if ask("Should I delete all your important files?"):
  echo "I'm sorry Dave, I'm afraid I can't do that."
else:
  echo "I think you know what the problem is just as well as I do."

proc sumTillNegative(x: varargs[int]): int =
  for i in x:
    if i < 0:
      return
    result = result + i

echo sumTillNegative() # echos 0
echo sumTillNegative(3, 4, 5) # echos 12
echo sumTillNegative(3, 4 , -1 , 6) # echos 7

proc printSeq(s: seq, nprinted: int = -1) =
  var nprinted = if nprinted == -1: s.len else: min(nprinted, s.len)
  for i in 0 ..< nprinted:
    echo s[i]

proc divmod(a, b: int; res, remainder: var int) =
  res = a div b        # integer division
  remainder = a mod b  # integer modulo operation

var
  x, y: int
divmod(8, 5, x, y) # modifies x and y
echo x
echo y

discard ask("May I ask a pointless question?")


proc p(x, y: int = 3): int {.discardable.} =
  return x + y

p(3, 4) # now valid
echo p(x=4)

proc toString(x: int): string =
  result =
    if x < 0: "negative"
    elif x > 0: "positive"
    else: "zero"

proc toString(x: bool): string =
  result =
    if x: "yep"
    else: "nope"

assert toString(13) == "positive" # calls the toString(x: int) proc
assert toString(true) == "yep"    # calls the toString(x: bool) proc

if `==`( `+`(3, 4), 7): echo "True"


# forward declaration:
proc even(n: int): bool

proc odd(n: int): bool =
  assert(n >= 0) # makes sure we don't run into negative recursion
  if n == 0: false
  else:
    n == 1 or even(n-1)

proc even(n: int): bool =
  assert(n >= 0) # makes sure we don't run into negative recursion
  if n == 1: false
  else:
    n == 0 or odd(n-1)

