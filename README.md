# arctic-shadow

Ultimate goal is a compiler for some 8 bit thing.

## Release

We definitely don't have anything to release yet.

## Development

### Setting Up the Environment

Getting this to work on Windows is futile. Do not resist. Linux only.

1. Install Flex (LEX) and Bison (YACC): `sudo apt install flex bison`
2. Git clone the repository & cd into it
3. Build the project: `make`

Whatever IDE you're using (bonus points for using vim), you'll probably have some IDE specific files (e.g. Jetbrains IDEA IDEs create an ".idea" directory.)
Please ignore them by 
1. Adding them to your user-specific `~/.gitignore` file. 
2. `git config --global core.excludesfile $HOME/.gitignore` to make sure you're using it.

Hopefully that's it.
