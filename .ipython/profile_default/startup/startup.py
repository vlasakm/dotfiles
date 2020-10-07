import sys

sys.dont_write_bytecode = True

ipython = get_ipython()
ipython.magic("%reload_ext autoreload")
ipython.magic("%autoreload 2")
