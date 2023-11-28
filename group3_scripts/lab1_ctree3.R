fitK <- ctree(Kyphosis ~ Age + Number + Start, data=kyphosis)
plot(fitK, main="Conditional Inference Tree for Kyphosis")
plot(fitK, main="Conditional Inference Tree for Kyphosis",type="simple")

#etc.

plot(fitK, main = "Conditional Inference Tree for Kyphosis", type = "simple", 
     terminal_panel = node_barplot(fitK, col = "lightblue", fill = "darkblue"))
