def parabola(x):
    return (x-3) * (x-6)

def vee(x):
    return abs(x-2)

def again(f):
    """
    >>> again(parabola)  #parabola(4) == parabola(5)
    5
    >>> again(vee)       #vee(1) == vee(3)
    3
    """
    n = 1
    if f(n) != f(0):
        m = 0
        while f(m) != f(n):
            if m == n-1:
                break
            m += 1
            