# Visualisasi Peta Pangaribuan
tm_shape(dem_pangaribuan) + 
  tm_raster(col = "SRTM_30", palette = "YlGnBu", title = "Elevasi (m)") + 
  tm_shape(pangaribuan_utm) + 
  tm_borders(col = "black", lwd = 1,2) +
  tm_shape(sungai_utm) + 
  tm_lines(col = "lightblue",lwd = 1) + 
  tm_shape(jalan_utm) + 
  tm_lines(col = "black",lwd = 1.2) + 
  tm_title("Peta Wilayah Pangaribuan",position = c("center", "top")) +
  tm_layout(frame = TRUE,legend.outside = FALSE) +
  tm_scalebar(position = c("left", "bottom")) +
  tm_compass(type = "8star",position = c("right", "top"))

# Visualisasi Peta Tarutung
tm_shape(dem_tarutung) + 
  tm_raster(col = "SRTM_30", palette = "YlGnBu", title = "Elevasi (m)") + 
  tm_shape(tarutung_utm) + 
  tm_borders(col = "black", lwd = 1,2) +
  tm_shape(sungai_utm) + 
  tm_lines(col = "lightblue",lwd = 1) + 
  tm_shape(jalan_utm) + 
  tm_lines(col = "black",lwd = 1.2) + 
  tm_title("Peta Wilayah Tarutung",position = c("center", "top")) +
  tm_layout(frame = TRUE,legend.outside = FALSE) +
  tm_scalebar(position = c("left", "bottom")) +
  tm_compass(type = "8star",position = c("right", "top"))
