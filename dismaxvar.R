library(sf)
library(prettymapr)
library(raster)

#Diretório
setwd("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/Discharge/max")

#Shapefiles
mundo <- read_sf(dsn="C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/occs/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp")

#Dataframe com occs
occs <- read.csv(file = "occs_cleaned.csv", header = T);
head(occs)
pontos_sf <- st_as_sf(occs, coords = c("longitude", "latitude"))
crs <- st_crs(mundo)
st_crs(pontos_sf) <- crs  


#######VARIÁVEIS########

####discharge max historical
dismax<-raster("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/Discharge/max/Q-max_gfdl_hist_1976-01-31_to_2005-12-31.nc")
dismax
plot(dismax)

#recortar camada
dismaxcrop <- crop(dismax, extent(-70, -20, -40, 0))
plot(dismaxcrop)

#mapa
pdf('dismaxhist.pdf')
plot(dismaxcrop)
plot(st_geometry(mundo), add=TRUE, border = "grey60",xlim = c(20,50), ylim = c(-30, 20), axes = TRUE)
plot(pontos_sf, add = TRUE, col = "black", pch = 16, cex = 0.5)
scalebar(1000,xy=c(50,0),type='bar',divs=2, below='km')
addnortharrow('topright',scale=0.6)
box()
dev.off()


####discharge max 2p6
dismax2p6<-raster("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/Discharge/max/Q-max_gfdl_rcp2p6_2041-01-31_to_2060-12-31.nc")
dismax2p6
plot(dismax2p6)

#recortar camada
dismaxcrop2p6 <- crop(dismax2p6, extent(-70, -20, -40, 0))
plot(dismaxcrop2p6)

#mapa
pdf('dismax2p6.pdf')
plot(dismaxcrop2p6)
plot(st_geometry(mundo), add=TRUE, border = "grey60",xlim = c(20,50), ylim = c(-30, 20), axes = TRUE)
plot(pontos_sf, add = TRUE, col = "black", pch = 16, cex = 0.5)
scalebar(1000,xy=c(50,0),type='bar',divs=2, below='km')
addnortharrow('topright',scale=0.6)
box()
dev.off()


####discharge max 4p5
dismax4p5<-raster("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/Discharge/max/Q-max_gfdl_rcp4p5_2041-01-31_to_2060-12-31.nc")
dismax4p5
plot(dismax4p5)

#recortar camada
dismaxcrop4p5 <- crop(dismax4p5, extent(-70, -20, -40, 0))
plot(dismaxcrop4p5)

#mapa
pdf('dismax4p5.pdf')
plot(dismaxcrop4p5)
plot(st_geometry(mundo), add=TRUE, border = "grey60",xlim = c(20,50), ylim = c(-30, 20), axes = TRUE)
plot(pontos_sf, add = TRUE, col = "black", pch = 16, cex = 0.5)
scalebar(1000,xy=c(50,0),type='bar',divs=2, below='km')
addnortharrow('topright',scale=0.6)
box()
dev.off()



####discharge max 6p0
dismax6p0<-raster("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/Discharge/max/Q-max_gfdl_rcp6p0_2041-01-31_to_2060-12-31.nc")
dismax6p0
plot(dismax6p0)

#recortar camada
dismaxcrop6p0 <- crop(dismax6p0, extent(-70, -20, -40, 0))
plot(dismaxcrop6p0)

#mapa
pdf('dismax6p0.pdf')
plot(dismaxcrop6p0)
plot(st_geometry(mundo), add=TRUE, border = "grey60",xlim = c(20,50), ylim = c(-30, 20), axes = TRUE)
plot(pontos_sf, add = TRUE, col = "black", pch = 16, cex = 0.5)
scalebar(1000,xy=c(50,0),type='bar',divs=2, below='km')
addnortharrow('topright',scale=0.6)
box()
dev.off()



####discharge max 8p5
dismax8p5<-raster("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/Discharge/max/Q-max_gfdl_rcp8p5_2041-01-31_to_2060-12-31.nc")
dismax8p5
plot(dismax8p5)

#recortar camada
dismaxcrop8p5 <- crop(dismax8p5, extent(-70, -20, -40, 0))
plot(dismaxcrop8p5)

#mapa
pdf('dismax8p5.pdf')
plot(dismaxcrop8p5)
plot(st_geometry(mundo), add=TRUE, border = "grey60",xlim = c(20,50), ylim = c(-30, 20), axes = TRUE)
plot(pontos_sf, add = TRUE, col = "black", pch = 16, cex = 0.5)
scalebar(1000,xy=c(50,0),type='bar',divs=2, below='km')
addnortharrow('topright',scale=0.6)
box()
dev.off()