echo "Counting to ten: "
for i in countup(1, 10):
  echo i

iterator countdown(start: int): int =
  var res = start
  while res >= 0:
    yield res
    dec(res)

for y in countdown(10):
    echo y



