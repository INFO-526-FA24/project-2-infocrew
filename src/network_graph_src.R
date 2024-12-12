# Load libraries
library(networkD3)
library(webshot)
library(htmlwidgets)
library(htmltools)

# Read data
data <- read.csv("C:/Users/aasth/OneDrive/data viz/project-2-infocrew/data/imdb_edgelist.csv",
                 nrows = 500, header = TRUE, stringsAsFactors = FALSE)

# Check if data is read correctly
if (is.null(data) || nrow(data) == 0) {
  stop("Failed to read data.")
}

# Unique nodes
nodes <- unique(c(data$From, data$To))
nodes_df <- data.frame(name = nodes, group = 1) # Add a 'group' column for compatibility

# Map node names to IDs
data$FromID <- match(data$From, nodes) - 1
data$ToID <- match(data$To, nodes) - 1

# Check if IDs are mapped correctly
if (any(is.na(data$FromID)) || any(is.na(data$ToID))) {
  stop("Failed to map node names to IDs.")
}

# Create force network graph
graph <- forceNetwork(
  Links = data.frame(source = data$FromID, target = data$ToID, value = data$Strength),
  Nodes = nodes_df,
  Source = "source",
  Target = "target",
  Value = "value",
  NodeID = "name",
  Group = "group",
  fontSize = 16,          # Increase font size
  fontFamily = "Arial",   # Use a bold-compatible font like Arial
  opacity = 0.9,          # Transparency for nodes
  zoom = TRUE,            # Enable zoom
  linkDistance = 100,     # Distance between nodes
  opacityNoHover = 0.1    # Highlight connections on hover
)

# Save the force network graph as an HTML file
html_file <- "force_graph.html"
saveNetwork(graph, file = html_file, selfcontained = TRUE)

# Convert the saved HTML to PNG using webshot
webshot::webshot(html_file, file = "force_graph.png", vwidth = 1200, vheight = 800)
