source("setup.R")

buoys = gom_buoys()
db = brickman_database()


b = buoys |> filter(id == "M01")
d = db |> filter(scenario == "RCP45", year == "2055", interval == "mon", var == "SST") 
x = read_brickman(d) |> select(SST)


long_values = extract_brickman(x, b)
print(long_values)
wide_values = extract_brickman(x, b, form = "wide")
print(wide_values)

ggplot(data = long_values,
       mapping = aes(x = month, y = value)) +
  geom_point() + 
  labs(title = "Temp at buoy M01")

