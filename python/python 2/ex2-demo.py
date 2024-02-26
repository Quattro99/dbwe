
class CalculationError(Exception):

    def  __init__(self, message):
        super().__init__(message)

def calculate(x, y, op):
    """Calculate x and y for the given operator.

    Args:
        x: Operand 1 of type float or int.
        y: Operand 2 of type float or int.
        op: Operator character, must be one of ['+', '-', '*', '/']. 

    Returns:
        The result of the operation.

    Raises:
        CalculationError if parameters are invalid.
    """

    if type(x) != int and type(x) != float:
        raise CalculationError ("Invalid type for x")
   
    if type(y) != int and type(y) != float:
        raise CalculationError ("Invalid type for y")
   
    if op == '+':
        result = x + y
    elif op == '-':
        result = x - y
    elif op == '*':
        result = x * y
    elif op == '/':
        if y == 0:
            raise CalculationError("Division by zero is not allowed.")
        result = x / y
    else:
        raise CalculationError(f"Unsupported operator '{op}'")
    print(x, op, y, "=", result)
    return result

calculate(1,2,'+')
calculate(1,2,'-')
calculate(1,2,'*')
calculate(2,1,'/')
