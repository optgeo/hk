require 'json'

while gets
  f = JSON.parse($_.strip.delete("\x1e"))
  f["tippecanoe"] = {
    :minzoom => 4,
    :maxzoom => 11,
    :layer => 'forest'
  }
  print "\x1e#{JSON.dump(f)}\n"
end
