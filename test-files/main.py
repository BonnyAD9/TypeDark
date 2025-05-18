#!/usr/bin/python3

from typing import List
from enum import Enum

class Test(Enum):
    @staticmethod
    def get_value(**kwargs):
        return 31315

def foo(x: List[int] = []) -> List[int]:
    x.append(4)
    return x

print(foo())
print(foo())
