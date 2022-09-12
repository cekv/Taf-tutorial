library(icesTAF)
library(dplyr)
library(sf)
library(ggplot2)

#get data
data(trees)
write.csv(cars, "cars.csv")

taf.skeleton()

#copy a file from a local source
cp("cars.csv", "bootstrap/initial/data")


# document
draft.data(
  data.files = "trees.csv",
  originator = "Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976) The Minitab Student Handbook. Duxbury Press.",
  title = "Diameter, Height and Volume for Black Cherry Trees",
  file = TRUE,
  append = FALSE
)

# download gridded netcdf SST data from UK Met office
library(icesTAF)
download.file(
  "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc",
  mode = "wb",
  destfile = "HadSST.4.0.1.0_median.nc"
)

download(
  "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc"
)

draft.data(
  data.files = "HadSST.4.0.1.0_median.nc",
  originator = "UK MET office",
  title = "Met Office Hadley Centre observations datasets",
  year = 2022,
  source = "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc",
  file = TRUE,
  append = TRUE
)

draft.data(
  data.files = "ICES_Areas_20160601_cut_dense_3857.shp",
  originator = "ICES",
  title = "ICES Areas",
  year = 2016,
  source = "http://gis.ices.dk/shapefiles/ICES_areas.zip",
  file = TRUE,
  append = TRUE
)

# use a folder of initial data
# ------
# create a data collection (i.e. a folder of related files which will have BIB entry)
mkdir("bootstrap/initial/data/data-collection/")
cp(
  "D:/taf-workshop/taf-workshop-example-1/bootstrap/initial/data/*",
  "bootstrap/initial/data/data-collection/"
)
draft.data(
  data.files = "data-collection",
  originator = "R datasets package",
  title = "Collection of R data",
  source = "folder",
  file = TRUE,
  append = TRUE # create a new DATA.bib
)
taf.bootstrap(software = FALSE)


#bring in an online file
# UK met offices on sea surface temperature
download.file(
  "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc",
  mode = "wb",
  destfile = "HadSST.4.0.1.0_median.nc"
)

# document the data
draft.data(
  data.files = "trees.csv",
  originator = "Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976) The Minitab Student Handbook. Duxbury Press.",
  title = "Diameter, Height and Volume for Black Cherry Trees",
  file = TRUE,
  append = FALSE
)

draft.data(
  data.files = "cars.csv",
  originator = "cars",
  title = "cars",
  file = TRUE,
  append = T
)

draft.data(
  data.files = "HadSST.4.0.1.0_median.nc",
  originator = "UK MET office",
  title = "Met Office Hadley Centre observations datasets",
  year = 2022,
  source = "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc",
  file = TRUE,
  append = TRUE
)

# check bootstrap works as we work, moves initial data files to the bootstrap data, where you should work from now on
# taf.bootstrap runs the procedure but does not reinstate everything only data from the initial data folder
taf.bootstrap()

download.file(
  "http://gis.ices.dk/shapefiles/ICES_areas.zip",
  "temp.zip")

unzip("temp.zip")
unlink("temp.zip")

#download("http://gis.ices.dk/shapefiles/ICES_area.zip")
#unzip("ICES_area.zip")

areas <- sf::st_read("ICES_Areas_20160601_cut_dense_3857.shp")
