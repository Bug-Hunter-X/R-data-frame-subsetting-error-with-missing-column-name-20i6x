```R
# This code attempts to subset a data frame using a character vector containing column names, 
# but it produces an unexpected error if one of the column names is not found.

df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
cols_to_select <- c("a", "d", "c")
result <- df[, cols_to_select]
```