# 1. Correção do polígono da União na área continental de SC

library(sf)

## Lê o arquivo no R
polUniao <- st_zm(st_read("Poligonos_LPM_Homologada.geojson"))

## Verifica qual o polígno de área igual ao valor citado, obtida no visualizador.
which(polUniao$AREA_M2_FM == 507119.30)

## Polígono 200: plotagem para verificação.
plot(polUniao[200, 1])

## Extrai as coordenadas do polígono
coords <- st_coordinates(polUniao[200, ])

## Remove a coordenada problemática (-48.6068 -27.870194)
coords <- coords[-181, ]

## Refaz o polígono
pol <- st_sfc(st_polygon(list(coords)))

## Extrai os metadados
metadados <- st_drop_geometry(polUniao[200, ])

## Junta o novo polígono aos metadados
spdf <- st_sf(metadados, geometry = pol, crs = 4326)

## Substitui o polígono original com o modificado
polUniao <- rbind(polUniao[1:199,], st_zm(spdf), polUniao[201:231,])

## Remove o polígono duplicado
polUniao <- polUniao[-141, ]

## Reescreve o arquivo dos polígonos
st_write(polUniao, "Poligonos_LPM_Homologada.geojson", delete_dsn = TRUE)

## 2. Junção com Polígonos da União na Ilha de SC

polUniao <- st_read("Poligonos_LPM_Homologada.geojson")
polUniao_ilha <- st_zm(st_read("Poligono_AreaUniao_LPM_Homologada_IlhaDeSantaCatarina.kml"))

polUniao_ilha <- st_sf(data.frame(TIPO = "AREA_DA_UNIAO",
                                  PROCESSO = NA,
                                  TRECHO = "AGRONOMICA-SACO_DOS_LIMOES",
                                  SUBTRECHO = NA,
                                  LPM_LTM = NA,
                                  FONTE = NA,
                                  AREA_M2_FM = 2158837.15,
                                  AREA_M2_QG = NA,
                                  AREA_KM2_Q = NA,
                                  STATUS = "HOMOLOGADA",
                                  EDITAL_NUM = NA,
                                  DATA_HOMOL = NA,
                                  geometry = st_geometry(polUniao_ilha))
                       )

## Junta os dois polígonos
polUniao <- rbind(polUniao, polUniao_ilha)

## Reescreve o arquivo dos polígonos
st_write(polUniao, "Poligonos_LPM_Homologada.geojson", delete_dsn = TRUE)
