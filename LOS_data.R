data(LOS_model, package = "NHSRdatasets")

LOS_data <-
  LOS_model |>
  dplyr::filter(Organisation %in% c("Trust1", "Trust2", "Trust3")) |>
  dplyr::add_column(Sex = as.factor(sample(c("Male", "Female"),
    size = 90, replace = TRUE
  ))) |>
  dplyr::rename(Area = Organisation) |>
  dplyr::select(Area, Age, Sex, LOS) |>
  dplyr::mutate(Area = dplyr::case_when(
    Area == "Trust1" ~ "Midsomer",
    Area == "Trust2" ~ "Ponty Pandy",
    Area == "Trust3" ~ "Greendale"
  ))