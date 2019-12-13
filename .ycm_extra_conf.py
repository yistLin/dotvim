import os
import ycm_core

C_BASE_FLAGS = [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-Wno-long-long',
        '-Wno-variadic-macros',
        '-fexceptions',
        '-ferror-limit=10000',
        '-DNDEBUG',
        '-std=c11',
        '-I/usr/lib/',
        '-I/usr/include/'
        ]

CPP_BASE_FLAGS = [
        '-Wall',
        '-Wextra',
        '-Wno-long-long',
        '-Wno-variadic-macros',
        '-fexceptions',
        '-ferror-limit=10000',
        '-DNDEBUG',
        '-std=c++1z',
        '-xc++',
        '-I/usr/lib/',
        '-I/usr/include/'
        ]

C_SOURCE_EXTENSIONS = [
        '.c'
        ]

CPP_SOURCE_EXTENSIONS = [
        '.cpp',
        '.cxx',
        '.cc'
        ]

def FlagsForFile(filename):
    dirname = os.path.dirname(filename)
    extension = os.path.splitext(filename)[1]
    final_flags = C_BASE_FLAGS if extension in C_SOURCE_EXTENSIONS else CPP_BASE_FLAGS
    final_flags.append('-I' + dirname)
    final_flags.append('-I' + dirname + '/../inc')
    return { 'flags': final_flags, 'do_cache': True }
