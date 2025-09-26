#!/usr/bin/python3

from typing import List
from enum import Enum

class Test(Enum):
    @staticmethod
    def get_value(**kwargs):
        """Documentation"""
        return 31315

def foo(x: List[int] = []) -> List[int]:
    x.append(4)
    return x

x = """string"""

if x or True:
    pass

print(foo())
print(foo())
