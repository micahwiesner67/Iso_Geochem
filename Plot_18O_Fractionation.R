#This function is meant to plot the fractionation of 18O from water to calcite and compare to known fractionations (Kim & O'Neil [1997] and Daeron [2019])

Plot_18O_Fractionation <- function(df, title){
  iso_plot <- df %>% 
    ggplot() + 
    ggtitle(title) + 
    geom_point(aes(x = `1000/T`, y = `1000ln(alpha)`)) +
    stat_function(fun = function(x) 18.03*x - 32.42, geom = "line", 
                  aes(color = "Kim & O'Neil", linetype = "Kim & O'Neil")) + #Kim O'Neil
    stat_function(fun = function(x) 17.57*x - 29.13, geom = "line", 
                  aes(color = "Daeron & Coplen", linetype = "Daeron & Coplen")) + #Daeron_Coplen
    xlim(c(3.13, 3.66)) + 
    xlab(expression(frac(1000, T))) + ylab(expression("1000ln"~alpha)) +
    scale_color_manual(labels = c("Kim & O'Neil", "Daeron & Coplen"), 
                       values = c("purple", "green")) +
    theme_bw() +
    theme(legend.title = element_blank())
  
    return(iso_plot)
}
