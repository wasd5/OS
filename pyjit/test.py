# reading code from a file
f = open('my_code.py', 'r')
code_str = f.read()
f.close()
print(f)
code = compile(code_str, 'my_code.py', 'exec')
print(code)
exec(code)
