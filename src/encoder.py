import sys

i = 0
for line in sys.stdin:
    j = 0
    for c in line:
       if c == '0' or c == '1':
         print(f"cell({i},{j},{c}).")
       j += 1
    i += 1

print(f"dim({i}).")
