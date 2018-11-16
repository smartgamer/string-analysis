
# Basic string operations

setwd("~/Documents/myCode/Rscript")

a=c(1,1,3,4,5)
b=c(1,2,4,5,5)
a!=b
sum(a==b)
a*b
a+b


which(a==1)

c=a[which(a==1)]+b[which(a==1)]
c
c=(a+b)[which(a==1)]
c

d=data.frame(which(a==1), c)
d

merge(a, d)


ad=as.data.frame(a)
ad$ind=rownames(ad)
ad$ind
ad
colnames(ad)
rownames(ad)


bd=data.frame(b)
bd$ind=rownames(bd)
ab=merge(ad,bd, by="ind")
ab

ab$ab=paste(ab$a, ab$b,sep = "|")
ab

ab$abc=paste(ab$a, ab$b,collapse = "|")
ab




#https://www.r-bloggers.com/collapse-pasting-in-r/
a <- c("something", "to", "paste")
# [1] "something" "to" "paste" 
paste(a, sep="_") 
# [1] "something" "to" "paste"
paste(a, collapse="_") 
# [1] "something_to_paste"
paste(a, sep="_", collapse="-")
# [1] "something-to-paste"

paste(a, collapse="|") 
 
 
#
x <- c("a", "b", "c", "d")
y <- c("w", "x", "y", "z")
paste(x,y)
paste0(x,y)
paste(x, y, sep="%%")
paste(x, y, sep="%%", collapse=",")

# To confirm our conjecture, we can swap the sep and 
# collapse arguments. The statement below will return
# "a,w%%b,x%%c,y%%d,z"
paste(x, y, sep=",", collapse="%%")

?paste

###
#What is the difference between paste/paste0 and str_c?
#https://stackoverflow.com/questions/50818932/what-is-the-difference-between-paste-paste0-and-str-c

# paste0(..., collapse = NULL)is a wrapper for paste(..., sep = "", collapse = NULL), which means there is no separator. In other words, with paste0() you can not apply some sort of separator, while you do have that option with paste(), whereas a single space is the default.
# 
# str_c(..., sep = "", collapse = NULL) is equivalent to paste(), which means you do have the option to customize your desired separator. The difference is for str_c() the default is no separator, so it acts just like paste0() as a default.
# 
# Paste() and paste0() are both functions from the base package, whereas str_c() comes from the stringr package.

# I did not test/microbenchmark it, but from my experience I do agree to Ryan str_c() is generally faster.

###
#Difference between `paste`, `str_c`, `str_join`, `stri_join`, `stri_c`, `stri_paste`?
#https://stackoverflow.com/questions/53118271/difference-between-paste-str-c-str-join-stri-join-stri-c-stri-pa/53118273#53118273


###case insensitive
#https://stackoverflow.com/questions/37802388/extract-pattern-from-string-in-r-without-distinguishing-between-upper-and-lower
library(tidyverse)
a <- "She has Red hair and blue eyes"
b <- c("Red", "Yellow", "Blue")
str_extract(a, b)  #"Red" NA    NA

library(stringr)  #included in tidyverse package, so not needed here
str_extract(a, fixed(b, ignore_case=TRUE))  #case insensitive

unlist(sapply(tolower(b), function(x) {
  x1 <- regmatches(a, gregexpr(x, tolower(a)))
  replace(x1, x1 == "character(0)", NA)}), use.names=FALSE)


library(stringi)
stri_extract_all_fixed(a, b, opts_fixed = list(case_insensitive = TRUE))
# or using simplify = TRUE to get a non-list output
stri_extract_all_fixed(a, b, opts_fixed = list(case_insensitive = TRUE), 
                       simplify = TRUE)
