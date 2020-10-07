library(sf)

lltm_demarcada_ilha <- st_read("linhas/LLTM_DEMARCADA_ILHASC.geojson")
lltm_homologada_ilha <- st_read("linhas/LLTM_HOMOLOGADA_ILHASC.geojson")

lpm_demarcada_ilha <- st_read("linhas/LPM_DEMARCADA_ILHASC.geojson")
lpm_homologada_ilha <- st_read("linhas/LPM_HOMOLOGADA_ILHASC.geojson")

#LLTM
lltm_demarcada_ilha$FID <- c(0,1)
lltm_demarcada_ilha$Linha <- rep("LLTM", 2)
lltm_demarcada_ilha$Status <- rep("demarcada", 2)
lltm_demarcada_ilha$SRID <- rep(4326, 2)
lltm_demarcada_ilha$descriptio <- NULL
lltm_demarcada_ilha$timestamp <- NULL
lltm_demarcada_ilha$begin <- NULL
lltm_demarcada_ilha$end <- NULL
lltm_demarcada_ilha$altitudeMo <- NULL
lltm_demarcada_ilha$tessellate <- NULL
lltm_demarcada_ilha$extrude <- NULL
lltm_demarcada_ilha$visibility <- NULL
lltm_demarcada_ilha$drawOrder <- NULL
lltm_demarcada_ilha$icon <- NULL

lltm_demarcada_ilha <- lltm_demarcada_ilha[, c(2, 3, 4, 5, 1)]
lltm_demarcada_ilha <- st_zm(lltm_demarcada_ilha)

lltm_homologada_ilha$FID <- c(0,1)
lltm_homologada_ilha$Linha <- rep("LPM", 2)
lltm_homologada_ilha$Status <- rep("homologada", 2)
lltm_homologada_ilha$SRID <- rep(4326, 2)
lltm_homologada_ilha$descriptio <- NULL
lltm_homologada_ilha$timestamp <- NULL
lltm_homologada_ilha$begin <- NULL
lltm_homologada_ilha$end <- NULL
lltm_homologada_ilha$altitudeMo <- NULL
lltm_homologada_ilha$tessellate <- NULL
lltm_homologada_ilha$extrude <- NULL
lltm_homologada_ilha$visibility <- NULL
lltm_homologada_ilha$drawOrder <- NULL
lltm_homologada_ilha$icon <- NULL

lltm_homologada_ilha <- lltm_homologada_ilha[, c(2, 3, 4, 5, 1)]
lltm_homologada_ilha <- st_zm(lltm_homologada_ilha)

#LPM

lpm_demarcada_ilha$FID <- 0:4
lpm_demarcada_ilha$Linha <- rep("LPM", 5)
lpm_demarcada_ilha$Status <- rep("demarcada", 5)
lpm_demarcada_ilha$SRID <- rep(4326, 5)
lpm_demarcada_ilha$descriptio <- NULL
lpm_demarcada_ilha$timestamp <- NULL
lpm_demarcada_ilha$begin <- NULL
lpm_demarcada_ilha$end <- NULL
lpm_demarcada_ilha$altitudeMo <- NULL
lpm_demarcada_ilha$tessellate <- NULL
lpm_demarcada_ilha$extrude <- NULL
lpm_demarcada_ilha$visibility <- NULL
lpm_demarcada_ilha$drawOrder <- NULL
lpm_demarcada_ilha$icon <- NULL

lpm_demarcada_ilha <- lpm_demarcada_ilha[, c(2, 3, 4, 5, 1)]
lpm_demarcada_ilha <- st_zm(lpm_demarcada_ilha)

lpm_homologada_ilha$FID <- 0
lpm_homologada_ilha$Linha <- "LPM"
lpm_homologada_ilha$Status <- "homologada"
lpm_homologada_ilha$SRID <- 4326
lpm_homologada_ilha$descriptio <- NULL
lpm_homologada_ilha$timestamp <- NULL
lpm_homologada_ilha$begin <- NULL
lpm_homologada_ilha$end <- NULL
lpm_homologada_ilha$altitudeMo <- NULL
lpm_homologada_ilha$tessellate <- NULL
lpm_homologada_ilha$extrude <- NULL
lpm_homologada_ilha$visibility <- NULL
lpm_homologada_ilha$drawOrder <- NULL
lpm_homologada_ilha$icon <- NULL

lpm_homologada_ilha <- lpm_homologada_ilha[, c(2, 3, 4, 5, 1)]
lpm_homologada_ilha <- st_zm(lpm_homologada_ilha)

st_write(lltm_demarcada_ilha, "linhas/LLTM_DEMARCADA_ILHASC.geojson", delete_dsn = TRUE)
st_write(lltm_homologada_ilha, "linhas/LLTM_HOMOLOGADA_ILHASC.geojson", delete_dsn = TRUE)

st_write(lpm_demarcada_ilha, "linhas/LPM_DEMARCADA_ILHASC.geojson", delete_dsn = TRUE)
st_write(lpm_homologada_ilha, "linhas/LPM_HOMOLOGADA_ILHASC.geojson", delete_dsn = TRUE)
