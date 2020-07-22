<<<<<<< HEAD
import six

import hello_world

# def test_plus():
#     six.add_move("ss")
#     obj = Calculator
#     assert obj.plus(obj,2,3) ==5
def ge():
=======
from calculate import Calculator
import hello_world

def test_plus():
    obj = Calculator(2, 3)
    assert obj.plus() == 5

def test_hello_world():
>>>>>>> 5e197394bb12a14e947b76851da48c223f397cd7
    hello_world