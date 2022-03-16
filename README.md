![A vector field](https://github.com/ThomasEWoolley/Modelling_with_Differential_Equations/blob/main/Pictures/Front_image.png)

# Modelling with Differential Equations
These files provide an entire set of notes and problem sheets for a course in Modelling With Differential Equations. The course covers topics such as constitutive laws, steady states and linear stability of Ordinary Differential Equations systems.

These notes were written by Dr Thomas E. Woolley. They are not based on a specific book, but rather the culmination of being taught by a diverse range of undergraduate lecturers. As such, input is acknowledged from lecturers David Acheson, Paul Todd, Chris Davies, Philip Maini, Ruth Baker and Eamonnn Gaffney. Sincere apologies to anyone who has been off this list.

All errors are the fault of Dr Thomas E. Woolley.

# Folders
The contents of the folders should be pretty self explanatory. However, I expand on the titles here.

- Latex

This folder contains the main latex files that produce the notes. The main latex file "Master.tex" is split into chapters (see below). The notes are "gapped", such that some of the text is whited out to be inputted by the lecturer. The coloour of the text can be controlled from the "Master.tex" file in the line \definecolor{COLR}{rgb}{x,x,x}.

Namely, if the x is set to 0 (i.e. \definecolor{COLR}{rgb}{0,0,0}) then the text colour will be black and so the notes will be complete as in "Full.pdf". However, if x is set to 1 (i.e. \definecolor{COLR}{rgb}{1,1,1}) then the text will will be gapped as in "Gapped.pdf".

- Maple

Maple codes that do various algebraic manipulations and Taylor series that are too laborious to be done by hand.

- Matlab

Matlab codes that produce all the figures and animations that are contained within the notes.

- Matlab_students

A subsection of the codes from the Matlab file that are more animation orientated. These codes can be provided to students to play with.

- Pictures

All the figures that appear in the notes and problem sheets.

- Problem_sheets

Five problem sheets, with answers and computational problems covering the main topics of the course.

Like the latex notes the question and answers are provided in a single .tex document. However, the answers can be hidden by changing the line \includecomment{Answ} to \excludecomment{Answ}.

![Two simulations of the three body problem with slightly different initial conditions](
https://github.com/ThomasEWoolley/Modelling_with_Differential_Equations/blob/main/Pictures/3BP.gif)

# Course contents
Below I reproduce the sections that appear in the latex notes.

## 1 Introduction
1.1 Preliminary definitions

1.1.1 Existence and uniqueness

1.2 Taylor expansions

1.2.1 Multivariate Taylor expansion

1.3 Polar coordinates

1.4 Check list

## 2 How to model a system
2.1 Physical laws

2.2 Law of Mass Action

2.3 Check list

## 3 Non-dimensionalisation
3.1 The central idea

3.1.1 Examples of non-dimensionalisation through substitution of variables

3.1.2 Examples of non-dimensionalisation through the arrow method

3.2 Check list

## 4 Stationary states and stability
4.1 Linear stability

4.2 Bifurcations and hysteresis

4.3 Check list

## 5 Stability of ODE systems
5.1 Steady state classication of two-dimensional systems

5.1.1 D < 0

5.1.2 D > 0

5.2 Comments

5.3 Check list

## 6 Phase plane analysis
6.1 Check list

## 7 Putting it all together
7.1 Fish example

7.1.1 Model the system

7.1.2 Non-dimensionalise

7.1.3 Identify steady states

7.1.4 Calculate stability

7.1.5 Plot the phase-plane

7.1.6 What does it mean?

7.2 Pendulum example

7.3 Check list
