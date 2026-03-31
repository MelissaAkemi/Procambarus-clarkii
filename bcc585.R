library(sf)
library(prettymapr)
library(raster)

#Diretório
setwd("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/futuro/bcc585")

#Shapefiles
mundo <- read_sf(dsn="C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/occs/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp")

#Dataframe com occs
occs <- read.csv(file = "gbif,Procambarus clarkii.csv", header = T);
pontos_sf <- st_as_sf(occs, coords = c("longitude", "latitude"))
crs <- st_crs(mundo)
st_crs(pontos_sf) <- crs  


#######VARIÁVEIS########

bcc585<-stack("C:/Users/melia/Desktop/P. clarkii/RSTUDIO v1/Layers/futuro/tif/wc2.1_5m_bioc_BCC-CSM2-MR_ssp585_2021-2040.tif.opdownload")
names(bcc585)
####BCC-CSM2-MR ssp585####


for(i in 1:19){
  
  # bio
  bio_name <- sprintf("bio%02d", i)
  
  # acessar camada
  bio <- bcc585[[bio_name]]
  plot(bio)
  
  # recortar camada
  bio_crop <- crop(bio, extent(-70, -20, -40, 0))
  plot(bio_crop)
  
  # nome do arquivo pdf
  pdf_name <- sprintf("%s_bcc_sp585.pdf", bio_name)
  
  # mapa
  pdf(pdf_name)
  plot(bio_crop)
  plot(st_geometry(mundo), add=TRUE, border="grey60",
       xlim=c(-70,-20), ylim=c(-40,0), axes=TRUE)
  plot(pontos_sf, add=TRUE, col="black", pch=16, cex=0.5)
  scalebar(1000, xy=c(-65,-35), type='bar', divs=2, below='km')
  addnortharrow('topright', scale=0.6)
  box()
  dev.off()
}