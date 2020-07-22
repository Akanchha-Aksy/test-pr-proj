from calculate import Calculator
import hello_world

def test_plus():
    obj = Calculator(2, 3)
    assert obj.plus() == 5

def test_hello_world():
    hello_world