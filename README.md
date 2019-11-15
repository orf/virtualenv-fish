# virtualenv-fish

Fast and simple virtualenv utilities for the Fish shell.

## Installation

This package can be installed with fisher, fundle or oh-my-fish:

`fisher add orf/virtualenv-fish`

`fundle plugin 'orf/virtualenv-fish'`

`omf install virtualenv-fish`

## Usage

### Temporary virtual environment: `tmpenv`

Running `tmpenv` will create a temporary virtual environment for you to experiment with.

You can add custom package that will always be installed by creating a file in 
`~/.config/virtualenv-fish/global_requirements.txt`. e.g:

```
ipython
numpy
```

## Why not [virtualfish](https://github.com/excitedleigh/virtualfish)?

Virtualfish is pretty complete and contains a lot of functionality. However I 
found that it was slowing my shell startup down a lot. The main offender is the 
compulsory `eval (python -m virtualfish)` command you add to your `config.fish`. This 
easily adds 400 to 500ms to every shell startup.

The most used feature for me was the temporary virtual environment management, so I've 
ported this to pure fish.
