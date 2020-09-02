let
  x = 0     # x is of type ``int``
  y = 0'i8  # y is of type ``int8``
  z = 0'i64 # z is of type ``int64``
  u = 0'u   # u is of type ``uint``

var
  xx: int32 = 1.int32   # same as calling int32(1)
  yy: int8  = int8('a') # 'a' == 97'i8
  zz: float = 2.5       # int(2.5) rounds down to 2
  sumsum: int = int(xx) + int(yy) + int(zz) # sum == 100

var
  myBool = true
  myCharacter = 'n'
  myString = "nim"
  myInteger = 42
  myFloat = 3.14
echo myBool, ":", repr(myBool)
# --> true:true
echo myCharacter, ":", repr(myCharacter)
# --> n:'n'
echo myString, ":", repr(myString)
# --> nim:0x10fa8c050"nim"
echo myInteger, ":", repr(myInteger)
# --> 42:42
echo myFloat, ":", repr(myFloat)
# --> 3.1400000000000001e+00:3.1400000000000001e+00

type
  biggestInt = int64      # biggest integer type that is available
  biggestFloat = float64  # biggest float type that is available

type
  Direction = enum
    north, east, south, west

var direction = south     # `direction` is of type `Direction`; its value is `south`
echo direction            # writes "south" to `stdout`

type
  CharSet = set[char]
var
  s: CharSet
s = {'a'..'z', '0'..'9'} # This constructs a set that contains the
                         # letters from 'a' to 'z' and the digits
                         # from '0' to '9'

type
  MyFlag* {.size: sizeof(cint).} = enum
    A
    B
    C
    D
  MyFlags = set[MyFlag]

proc toNum(f: MyFlags): int = cast[cint](f)
proc toFlags(v: int): MyFlags = cast[MyFlags](v)

assert toNum({}) == 0
assert toNum({A}) == 1
assert toNum({D}) == 8
assert toNum({A, C}) == 5
assert toFlags(0) == {}
assert toFlags(7) == {A, B, C}

type
  IntArray = array[0..5, int] # an array that is indexed with 0..5
var
  num: IntArray
num = [1, 2, 3, 4, 5, 6]
for i in low(num)..high(num):
  echo num[i]

type
  BlinkLights = enum
    off, on, slowBlink, mediumBlink, fastBlink
  LevelSetting = array[north..west, BlinkLights]
var
  level: LevelSetting
level[north] = on
level[south] = slowBlink
level[east] = fastBlink
echo repr(level)  # --> [on, fastBlink, slowBlink, off]
echo low(level)   # --> north
echo len(level)   # --> 4
echo high(level)  # --> west

type
  LightTower = array[1..10, LevelSetting]
var
  tower: LightTower
tower[1][north] = slowBlink
tower[1][east] = mediumBlink
echo len(tower)     # --> 10
echo len(tower[1])  # --> 4
echo repr(tower)    # --> [[slowBlink, mediumBlink, ...more output..
# The following lines don't compile due to type mismatch errors
#tower[north][east] = on
#tower[0][1] = on

type
  Array = array[0..5, int] # an array that is indexed with 0..5
  QuickArray = array[6, int]  # an array that is indexed with 0..5
var
  a1: Array
  a2: QuickArray
a1 = [1, 2, 3, 4, 5, 6]
a2 = a1
for i in low(a1)..high(a1):
  echo a1[i], a2[i]

var
  seqOfInt: seq[int] # a reference to a sequence of integers
seqOfInt = @[1, 2, 3, 4, 5, 6] # the @ turns the array into a sequence allocated on the heap

for value in @[3, 4, 5]:
  echo value
# --> 3
# --> 4
# --> 5

for i, value in @[3, 4, 5]:
  echo "index: ", $i, ", value:", $value
# --> index: 0, value:3
# --> index: 1, value:4
# --> index: 2, value:5

var
  fruits:   seq[string]       # reference to a sequence of strings that is initialized with '@[]'
  capitals: array[3, string]  # array of strings with a fixed size

capitals = ["New York", "London", "Berlin"]   # array 'capitals' allows assignment of only three elements
fruits.add("Banana")          # sequence 'fruits' is dynamically expandable during runtime
fruits.add("Mango")

proc openArraySize(oa: openArray[string]): int =
  oa.len

assert openArraySize(fruits) == 2     # procedure accepts a sequence as parameter
assert openArraySize(capitals) == 3   # but also an array type

proc myWriteln(f: File, a: varargs[string]) =
  for s in items(a):
    write(f, s)
  write(f, "\n")

myWriteln(stdout, "abc", "def", "xyz")
# is transformed by the compiler to:
myWriteln(stdout, ["abc", "def", "xyz"])

proc writeln(f: File, a: varargs[string, `$`]) =
  for s in items(a):
    write(f, s)
  write(f, "\n")

writeln(stdout, 123, "abc", 4.0)
# is transformed by the compiler to:
writeln(stdout, [$123, $"abc", $4.0])

var
  a = "Nim is a programming language"
  b = "Slices are useless."

echo a[7..12] # --> 'a prog'
b[11..^2] = "useful"
echo b # --> 'Slices are useful.'


type
  Person* = object
    name*: string
    age*: int

var person1 = Person(name: "Peter", age: 30)

echo person1.name # "Peter"
echo person1.age  # 30

var person2 = person1 # copy of person 1

person2.age += 14

echo person1.age # 30
echo person2.age # 44


# the order may be changed
let person3 = Person(age: 12, name: "Quentin")

# not every member needs to be specified
let person4 = Person(age: 3)
# unspecified members will be initialized with their default
# values. In this case it is the empty string.
doAssert person4.name == ""

var p = Person(name: "Peter", age: 30)

while p.name != "xyz":
#   p.name is not evaluated if p == nil
    echo p.name

type
  # type representing a person:
  # A person consists of a name and an age.
  PersonT = tuple
    name: string
    age: int
  
  # Alternative syntax for an equivalent type.
  PersonX = tuple[name: string, age: int]
  
  # anonymous field syntax
  PersonY = (string, int)

var
  person: PersonT
  personX: PersonX
  personY: PersonY

person = (name: "Peter", age: 30)
# Person and PersonX are equivalent
personX = person

# Create a tuple with anonymous fields:
personY = ("Peter", 30)

# A tuple with anonymous fields is compatible with a tuple that has
# field names.
person = personY
personY = person

# Usually used for short tuple initialization syntax
person = ("Peter", 30)

echo person.name # "Peter"
echo person.age  # 30

echo person[0] # "Peter"
echo person[1] # 30

# You don't need to declare tuples in a separate type section.
var building: tuple[street: string, number: int]
building = ("Rue del Percebe", 13)
echo building.street

# The following line does not compile, they are different tuples!
#person = building
# --> Error: type mismatch: got (tuple[street: string, number: int])
#     but expected 'Person'


import os

let
  path = "usr/local/nimc.html"
  (dir, name, ext) = splitFile(path)
  baddir, badname, badext = splitFile(path)
echo dir      # outputs `usr/local`
echo name     # outputs `nimc`
echo ext      # outputs `.html`
# All the following output the same line:
# `(dir: usr/local, name: nimc, ext: .html)`
echo baddir
echo badname
echo badext

type
  Node = ref object
    le, ri: Node
    data: int
var
  n: Node
new(n)
n.data = 9

proc echoItem(x: int) = echo x

proc forEach(action: proc (x: int)) =
  const
    data = [2, 3, 5, 7, 11]
  for d in items(data):
    action(d)

forEach(echoItem)
