discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;

let name = readLine(stdin)
if name == "":
  echo "Poor soul, you lost your name?"
elif name == "name":
  echo "Very funny, your name is name."
else:
  echo "Hi, ", name, "!"

discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;

let name2 = readLine(stdin)
case name2
of "":
  echo "Poor name2, you lost your name2?"
of "name2":
  echo "Very funny, your name2 is name2."
of "Dave", "Frank":
  echo "Cool name2!"
else:
  echo "Hi, ", name2, "!"

discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;

from strutils import parseInt

echo "A number please: "
let n = parseInt(readLine(stdin))
case n
of 0..2, 4..7: echo "The number is in the set: {0, 1, 2, 4, 5, 6, 7}"
of 3, 8: echo "The number is 3 or 8"
else: discard

discard
discard
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;
discard; discard; discard; discard; discard; discard; discard; discard;

echo "What's your name? "
var name3 = readLine(stdin)
while name3 == "":
  echo "Please tell me your name3: "
  name3 = readLine(stdin)
