---
title       : Cars app
subtitle    : 
author      : Shershebnev
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

MPG - is quite an important characterstic of cars, especially nowadays, when prices are going higher and higher everyday. Obviously, you want MPG to be as high as possible. This app can help you determing the average MPG based on parameters of the car you are going to purchase.

---

## Dataset

All calculations are based on the mtcars dataset.

---

## Parameters

MPG is calculated based on three parameters:

1. number of cylinders (4, 6 or 8);
2. weight of the car (1.5 to 5.5 lb/1000);
3. Transmission type (automatic or manual).

---

## Calculations

In order to get calculations user should select number of cylinders, set the desired range of weights and then choose the transmission type. If there is any data for specified range, average MPG will be shown after clicking the "Submit" button.

For example if number of cylinders = 4, weight is in range (1.5 : 3) and transmission type is manual, the user will get the following calculations:


```r
meanMPG(4, 1.5, 3, 1)
```

```
## [1] 24.39231
```
