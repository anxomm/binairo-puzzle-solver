# Binairo puzzle

## Introduction

The [Binairo puzzle](https://www.puzzle-binairo.com/), also known as "Binary Puzzle", "Takuzu", or "Tohu wa Vohu", is a logic puzzle with simple rules and challenging solutions. This project includes an automatic solver to solve any NxN grid of this game.

## Encoder

First of all, we encode the grid defined in a text file by running the following command:

```
python3 src/encoder.py < input.txt > input.lp
```

The input must define the grid as a sequence of rows of the same dimension, each with cells that can take the value '0' for white circles, '1' for black circles or '.' for empty cells. Some examples are provided in the [test](test/) folder.

## Solver

After encoding the grid just run the following command to obtain the solution in Clingo format:

```
clingo 0 src/binairo.lp input.lp
```

To generate the output in a text format similar to the input just execute:

```
python3 src/decoder.py src/binairo.lp input.lp > output.txt
```
