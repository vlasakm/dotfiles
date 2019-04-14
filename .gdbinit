set confirm off

# also needed: sudo strip /usr/lib/libstdc++.so.6
# https://unix.stackexchange.com/questions/246143/gdb-throws-error-on-arch-linux

#####
# from https://stackoverflow.com/questions/6219223/can-i-prevent-debugger-from-stepping-into-boost-or-stl-header-files
# skip all STL source files
define skipstl
python
# get all sources loadable by gdb
def GetSources():
    sources = []
    for line in gdb.execute('info sources',to_string=True).splitlines():
        if line.startswith("/"):
            sources += [source.strip() for source in line.split(",")]
    return sources

# skip files of which the (absolute) path begins with 'dir'
def SkipDir(dir):
    sources = GetSources()
    for source in sources:
        if source.startswith(dir):
            gdb.execute('skip file %s' % source, to_string=True)

# apply only for c++
if 'c++' in gdb.execute('show language', to_string=True):
    SkipDir("/usr")
end
end

define hookpost-run
    skipstl
end
define hookpost-start
    skipstl
end
#####
