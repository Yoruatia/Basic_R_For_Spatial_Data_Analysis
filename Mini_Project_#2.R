# Ngecek summary data DEM
summary(dem_pangaribuan)
summary(dem_tarutung)

# Klasifikasi berdasarkan ketinggian (zcl -> z Classification)
zcl <- matrix(c(
  0, 200, 1,
  200, 500, 2,
  500, Inf, 3
), ncol = 3, byrow = TRUE)

cl_pangaribuan <- classify(
  dem_pangaribuan, rcl = zcl, include.lowest = TRUE)
cl_tarutung <- classify(
  dem_tarutung, rcl = zcl, include.lowest = TRUE)

# Melihat banyak pengenaan klasifikasi
freq_pangaribuan <- freq(cl_pangaribuan)
freq_tarutung <- freq(cl_tarutung)

# Melihat resolusi
res(dem_pangaribuan)
res(dem_tarutung)

# Cell Area (ca) -> m^2
ca_pangaribuan <- prod(res(dem_pangaribuan))
ca_tarutung <- prod(res(dem_pangaribuan))

# Manipulasi Tabel

freq_pangaribuan$area_km2 <- freq_pangaribuan$count * ca_pangaribuan / 1000000
freq_tarutung$area_km2 <- freq_tarutung$count * ca_tarutung / 1000000

freq_pangaribuan$class <- factor(
  freq_pangaribuan$value,
  levels = c(1, 2, 3),
  labels = c("Rendah", "Sedang", "Tinggi")
)

freq_tarutung$class <- factor(
  freq_tarutung$value,
  levels = c(1, 2, 3),
  labels = c("Rendah", "Sedang", "Tinggi")
)

freq_pangaribuan
freq_tarutung
