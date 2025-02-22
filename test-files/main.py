#!/usr/bin/python3

from typing import List

def foo(x: List[int] = []) -> List[int]:
    x.append(4)
    return x

print(foo())
print(foo())
