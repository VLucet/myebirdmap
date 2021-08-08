
clean_ebird_data <- function(file){

  data_clean <- read.csv(file) %>%
    janitor::clean_names() %>%
    dplyr::mutate(date = lubridate::ymd(date)) %>%
    dplyr::select(-observation_details, -checklist_comments)

  return(data_clean)
}

aggregate_ebird_data <- function(ebird_data){

  ebird_data_ag <- ebird_data %>%
    dplyr::group_by(submission_id, latitude, longitude, location,
                    date, duration_min, distance_traveled_km) %>%
    dplyr::summarise(num_species = dplyr::n(), .groups = "drop")

  return(ebird_data_ag)
}

spatialize_ebird_data <- function(ebird_data){

  ebird_data_spatial <- ebird_data %>%
    sf::st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

  return(ebird_data_spatial)
}
