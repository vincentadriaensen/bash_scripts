# Productivity scripts
This repo is collection of some productivity scripts.

## Overview
### 1. find_occurences
This lets you find files in which specified word(s) occur. How to use:
- $ ` ./find_occurences.sh <location> <word|file_with_LineSeperated_words>`
- $ `curl -s https://raw.githubusercontent.com/vincentadriaensen/bash_scripts/master/find_occurences.sh | bash /dev/stdin <arg1> <arg2>` // Runs the script while downloading from GitHub
- **Tip**: add next line to your .bash_profile: `alias special_find="curl -s https://raw.githubusercontent.com/vincentadriaensen/bash_scripts/master/find_occurences.sh | bash /dev/stdin"` to use it like $ `special_find <arg1> <arg2>`
