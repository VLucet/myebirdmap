
#' @export
my_ebird_map <- function(file, aggregate_data = TRUE){

  clean_data <- clean_ebird_data(file)

  if(aggregate_data){

    spatial_data <- clean_data %>%
      aggregate_ebird_data() %>%
      spatialize_ebird_data()

    the_labels <- format_marker_labels(spatial_data)

  } else {

    spatial_data <- clean_data %>%
      spatialize_ebird_data()

    the_labels <- NULL

  }

  the_map <- leaflet::leaflet(data = spatial_data) %>%
    leaflet::addProviderTiles("OpenStreetMap.DE") %>%
    leaflet::addAwesomeMarkers(
      icon = get_awesome_icons(),
      clusterOptions = leaflet::markerClusterOptions(),
      label = the_labels,
      labelOptions = leaflet::labelOptions(
        style = list("font-weight" = "normal",
                     padding = "3px 8px"),
        textsize = "15px",
        direction = "auto"))

  return(the_map)
}
