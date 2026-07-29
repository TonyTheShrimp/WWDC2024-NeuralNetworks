# Neural Network Simulator

### Watch a neural network learn, one step at a time.

**Winner, Apple WWDC Swift Student Challenge 2024.**

---

## Why I built it

Backpropagation is taught as a chain of equations, and I could follow the equations without really
*seeing* what was happening. I wanted something where you set up a network, feed it something you
drew yourself, and watch the error travel backwards and the weights move — at a speed a person can
actually follow.

So the submission isn't a demo of a trained model. It's the training loop, made watchable.

## What's here

Four Swift Playgrounds, in the order I built them:

| | |
|---|---|
| **`SimpleNN/`** | The network on its own — feedforward, backpropagation, training, and nothing else. |
| **`ImageDrawer/`** | A 5×5 drawing surface, and the dataset format behind it. |
| **`ImageNetwork/`** | The two joined: a network that learns from what you drew. |
| **`AINeuralNetwork/`** | **The Challenge submission.** All of the above, plus the visualization and the explanatory screens. |

They're kept separate on purpose. Each one is small enough to read in a sitting, and the progression
from "just the maths" to "the finished thing" is the part I'd want someone to look at.

## Written from scratch

`NeuralNetwork.swift` implements `sigmoid` and its derivative, mean-squared-error loss, the forward
pass, backpropagation and the training loop by hand. It imports **`Foundation` and nothing else** —
no Core ML, no ML framework of any kind.

The one file that reaches for a library is `numSwfit.swift`, which uses **Accelerate** for the
low-level numeric work. It is 39 lines. Everything above it is mine.

That distinction matters to me, so I'd rather state it than let "from scratch" do more work than
it should.

## What it doesn't do

- **It isn't a machine-learning library, and it isn't fast.** Everything is sized so a human can
  watch it happen. Nothing here is built to scale.
- **It doesn't train on real datasets.** The problems stay small enough to stay legible.
- **It's a 2024 Swift Playground.** It was written for the Challenge's three-week submission window
  (Apple opened submissions on 5 February 2024 and closed them on the 28th) and hasn't been
  maintained since.

## The other one

This is my second Swift Student Challenge win. The
[first, in 2022](https://github.com/TonyTheShrimp/neuromotion-ar), was an AR game you play by moving
your head — it grew into six games and is on the App Store.

## Built with

Swift · SwiftUI · Swift Playgrounds · Accelerate

---

Built by Tony Ma · [LinkedIn](https://linkedin.com/in/wentao-ma-tony) · wentao.ma.261112@gmail.com
