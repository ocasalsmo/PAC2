library(pheatmap)


# Important wine-quality dataset

df <- read.csv("winequality-red.csv", sep=";")

# Creant heatmap

pheatmap(
  cor(df),
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  filename = "Wine_Quality_Heatmap.png"
)



