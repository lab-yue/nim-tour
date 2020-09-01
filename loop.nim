echo "Counting to ten: "
for i in countup(1, 10):
  echo i

echo "Counting to 10: "
var i = 1
while i <= 10:
  echo i
  inc(i) # increment i by 1

echo "Counting down from 10 to 1: "
for i in countdown(10, 1):
  echo i

var s = "some string"
for x in 0..5:
  for y in 0..<5:
    for z in 0..<s.len:
      echo (x, y, z)

for index, item in ["a","b"].pairs:
  echo item, " at index ", index

block myblock:
  echo "entering block"
  while true:
    echo "looping"
    break # leaves the loop, but not the block
  echo "still in block"

block myblock2:
  echo "entering block"
  while true:
    echo "looping"
    break myblock2 # leaves the block (and the loop)
  echo "still in block"

while true:
  var x = "ok"
  if x == "": continue
  x = ""
  echo x

#ifdef
when system.hostOS == "windows":
  echo "running on Windows!"
elif system.hostOS == "linux":
  echo "running on Linux!"
elif system.hostOS == "macosx":
  echo "running on Mac OS X!"
else:
  echo "unknown operating system"