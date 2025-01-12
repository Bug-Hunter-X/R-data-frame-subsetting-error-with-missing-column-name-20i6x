```R
# Solution 1: Using `dplyr` package for safer subsetting
library(dplyr)

df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
cols_to_select <- c("a", "d", "c")

result <- select(df, all_of(cols_to_select))
#select() will not throw errors for missing column but returns a warning message which is still informative.
result <- select(df, any_of(cols_to_select))
#any_of() will only select existing columns and ignore non-existing columns.

# Solution 2: Using `%in%` operator and handling missing columns

df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
cols_to_select <- c("a", "d", "c")

selected_cols <- cols_to_select[cols_to_select %in% names(df)]
result <- df[, selected_cols]

#Solution 3: Using tryCatch() to handle errors during subsetting

df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
cols_to_select <- c("a", "d", "c")

result <- tryCatch({df[,cols_to_select]}, error = function(e){print(paste("Error:",e)); return(NULL)}) 
```