#!/bin/bash

# type -a: list each of the available 'test' by priority

alias test="ls -l"
function test { echo "I'm a function"; }
type -a test

unalias test

# priority: alias --> function --> builtin --> program

# help type:
#type: type [-afptP] name [name ...]
#    Display information about command type.
#    
#    For each NAME, indicate how it would be interpreted if used as a
#    command name.
#    
#    Options:
#      -a	display all locations containing an executable named NAME;
#    	includes aliases, builtins, and functions, if and only if
#    	the `-p' option is not also used
#      -f	suppress shell function lookup
#      -P	force a PATH search for each NAME, even if it is an alias,
#    	builtin, or function, and returns the name of the disk file
#    	that would be executed
#      -p	returns either the name of the disk file that would be executed,
#    	or nothing if `type -t NAME' would not return `file'.
#      -t	output a single word which is one of `alias', `keyword',
#    	`function', `builtin', `file' or `', if NAME is an alias, shell
#    	reserved word, shell function, shell builtin, disk file, or not
#    	found, respectively
#    
#    Arguments:
#      NAME	Command name to be interpreted.
#    
#    Exit Status:
#    Returns success if all of the NAMEs are found; fails if any are not found.
#typeset: typeset [-aAfFgilrtux] [-p] name[=value] ...
#    Set variable values and attributes.
#    
#    Obsolete.  See `help declare'.
