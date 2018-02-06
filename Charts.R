
# Polar Plot 

ggplot(graph_data, aes(x=XColumn, y=YColumn, fill=YColumn)) +
  geom_histogram(binwidth=1, stat='identity') +
  scale_fill_gradient(low='white', high='red') + coord_polar()+
  theme(
    panel.background = element_rect(fill = "gray17",
                                    colour = "darkslateblue"),
    plot.background = element_rect(fill = "gray21"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "gray27"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "gray"),
    text = element_text(colour="White"),
    axis.text = element_text(colour="White"),
    legend.text = element_text(colour="White"),
    legend.background = element_rect(fill = "gray21",colour = "darkslateblue"),
    strip.background= element_rect(fill = "gray21")
    
  )


# Bar Chart

ggplot(graph_data,
       aes(x=XColumn, y=YColumn)) +
  geom_bar(stat="identity", fill="darkslateblue")+
  
  # theme_hc(bgcolor = "darkunica") 
  theme(
    panel.background = element_rect(fill = "gray17",
                                    colour = "darkslateblue",
                                    size = 0.5, linetype = "solid"),
    plot.background = element_rect(fill = "gray21"
    ),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "gray27"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "gray"),
    text = element_text(colour="White"),
    axis.text = element_text(colour="White"),
    legend.text = element_text(colour="Black")
  )
