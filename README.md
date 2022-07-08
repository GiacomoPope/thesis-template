# Thesis Template

## Disclaimer 

This template is not a template, it's just my thesis. I keep wanting to make it generalised to help more people but I just never find the time. I figured at least making the `.tex` available, people can work with it if they want.

## Thesis Typography

I spent far too much of my time writing my thesis procrastinating by instead tweaking the typograhy. However, I'm really happy with how it turned out, so I thought I would put it online.

I started writing my thesis following the [classicthesis](http://www.ctan.org/tex-archive/macros/latex/contrib/classicthesis/) LaTeX template, but it was too complicated and I wasted too much time fighting it to make changes. 

Inspired by [modernthesis](https://github.com/openHPI/modernthesis) I carved out what I needed and then built on top of that. What remains is a fairly lightweight thesis template which leans on XeTeX for the custom font.

The hardest part of getting the thesis to compile is including the `MinionPro` package, which has the benefit of a beautiful mathematical font but hours of headaches getting it all to work. Potentially a more efficient route is to use something like Palatino, or maybe [`ebgaramond-maths`](https://ctan.org/pkg/ebgaramond-maths?lang=en).

- For those who are using MacOS, there's a `Install Minion Pro` script written by Hao Wang which I have included. This can sometimes "just work". 

## General Setup

- LaTeX engine: `XeTeX`
- Bibliography engine: `BibTeX`

The `thesis.tex` has some comments. I also use the `jhep` style bibliography because I used it for all my papers and I like it. This could just be removed.

## Collaboration

If you would like to help generalise my work into a proper template, then please make a pull request. Small changes can be made as issues.