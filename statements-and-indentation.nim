var x = "T"
# no indentation needed for single assignment statement:
if x.len() == 4: x = "F"

# indentation needed for nested if statement:
if x == "T":
  var y = false
  if y:
    y = false
  else:
    y = true

# indentation needed, because two statements follow the condition:
if x != "F":
  x = "F"

const fac4 = (var v = 1; for i in 1..4: v *= i; v)
echo "fac4", fac4
