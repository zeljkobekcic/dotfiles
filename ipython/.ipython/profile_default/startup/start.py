import importlib
import sys 

imports = [
    {'package': 'numpy', 'as': 'np'},
    {'package': 'pandas', 'as': 'pd'},
    {'package': 'matplotlib.pyplot', 'as': 'plt'}
]

for i in imports:

    p = i['package']
    a = i['as']

    try:
        module_object = importlib.import_module(p)
        vars()[a] = module_object
        print("😀 {} imported".format(p))
    except ImportError:
        print("🔥 {} not installed".format(p))

