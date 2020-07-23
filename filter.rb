require 'json'

while gets
  f = JSON.parse($_.strip)
  f["tippecanoe"] = {
    :minzoom => 12,
    :maxzoom => 14,
    :layer => 'forest'
  }
  print "\x1e#{JSON.dump(f)}\n"
end
