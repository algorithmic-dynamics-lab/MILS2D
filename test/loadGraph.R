require("igraph")

#(PA for Perturbation Analysis)
loadGraphPA <- function(dataPath)
{
  
  loadedDF <- read.csv(dataPath,
                       header=FALSE,
                       sep=',', #separate by comma
                       quote="'", # quote by '
                       stringsAsFactors = FALSE,
                       check.names = FALSE)

  #selects numeric values, drops the rest
  loadedDF <- loadedDF[sapply(loadedDF, is.numeric)]
  
  rownames(loadedDF) <- colnames(loadedDF)
  loadedMat <- as.matrix(loadedDF)
  
  g <- graph_from_adjacency_matrix(loadedMat) %>%
    set_vertex_attr("label", value = rownames(loadedDF) )
  
  
  return(g)
}


loadGraph <- function(dataPath, 
                      separator, 
                      quoteSymbol)
{
  
  loadedDf <- read.csv(dataPath,
                       header=FALSE,
                       sep=separator,
                       quote=quoteSymbol,
                       stringsAsFactors = FALSE,
                       check.names = FALSE)

  #selects numeric values, drops the rest
  loadedDf <- loadedDf[sapply(loadedDf, is.numeric)]
  
  rownames(loadedDf) <- colnames(loadedDf)
  loadedMat <- as.matrix(loadedDf)
  loadedMat
}

## test
g <- loadGraphPA("starGraphAdjMatrix.csv")
print(g)

