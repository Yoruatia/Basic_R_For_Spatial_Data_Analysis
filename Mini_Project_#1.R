library(terra)
library(sf)
library(tmap)

#Data Vektor
admin <- read_sf("Data_Spasial/Admin.shp")
jalan <- read_sf("Data_Spasial/jalan_OSM.shp")
sungai <- read_sf("Data_Spasial/Sungai_OSM.shp")

#Data Raster
elevasi <- rast("Data_Spasial/SRTM_30.tif")
admin_utm <- st_transform(admin, crs = "EPSG:32647") 
elevasi_utm <- project(elevasi, "EPSG:32647")
st_crs(admin_utm)
st_crs(elevasi_utm)

#---------------------------------------------------------------------

plot(st_geometry(admin), axes = TRUE, border = "grey",
     main = "Peta Wilayah")
plot(st_geometry(sungai), col = "lightblue", lwd = 0.8, add = TRUE)
plot(st_geometry(jalan), col = "black", lwd = 1.2, add = TRUE)

#---------------------------------------------------------------------

#Membuat Garis Administrasi yang rapi
admin$KECAMATAN
pangaribuan <- admin[admin$KECAMATAN == "PANGARIBUAN",]
tarutung <- admin[admin$KECAMATAN == "TARUTUNG",]
plot(pangaribuan)
plot(tarutung)

pangaribuan_utm <- st_transform(pangaribuan, 32647)
tarutung_utm <- st_transform(tarutung, 32647)

pangaribuan_union <- st_union(pangaribuan_utm)
tarutung_union <- st_union(tarutung_utm)

plot(pangaribuan_union)
plot(tarutung_union)

#CROP DEM
pangaribuan_vect <- vect(pangaribuan_union)
tarutung_vect <- vect(tarutung_union)

dem_pangaribuan <- crop(elevasi_utm, pangaribuan_utm)
dem_tarutung <- crop(elevasi_utm, tarutung_utm)

#---------------------------------------------------------------------
# Masking
dem_pangaribuan <- mask(dem_pangaribuan, pangaribuan_vect)
dem_tarutung <- mask(dem_tarutung, tarutung_vect)

plot(dem_pangaribuan, main = "Kecamatan Pangaribuan")
plot(dem_tarutung, main = "Kecamatan Tarutung")

names(dem_pangaribuan)

#---------------------------------------------------------------------
# Transformasi ke UTM
jalan_utm <- st_transform(jalan, 32647)
sungai_utm <- st_transform(sungai, 32647)
