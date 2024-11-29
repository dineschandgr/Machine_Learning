# Apriori

# Data Preprocessing
# install.packages('arules')
library(arules)

# Check the transaction format
inspect(head(trans))
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)

transactions <- as(dataset, "transactions")

# Check the transactions
inspect(head(transactions))

# Training Apriori on the dataset


rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.2))

# View the first few rules
inspect(head(rules))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])

strong_rules <- subset(rules, lift > 3)

# Inspect the filtered rules
inspect(strong_rules)

# Visualize the rules using a graph
plot(strong_rules, method = "graph")

# Or visualize as a matrix
plot(strong_rules, method = "matrix")

# Or visualize as a scatter plot (showing support vs. confidence)
plot(strong_rules, method = "scatter", measure = c("support", "confidence"), shading = "lift")
