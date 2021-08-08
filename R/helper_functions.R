
# Get the check icon
get_awesome_icons <- function(){

  icons <- leaflet::awesomeIcons(
    icon = 'fa-check',
    iconColor = 'black',
    markerColor = "green",
    library = 'fa')

  return(icons)
}

# Format the labels
format_marker_labels <- function(ebird_data){

  marker_labels <- sprintf(
    "<strong> %s <br/> %d species <br/> </strong> %s, %s minutes",
    ebird_data$location, ebird_data$num_species,
    ebird_data$date, ebird_data$duration_min) %>%
    lapply(htmltools::HTML)

  return(marker_labels)
}
