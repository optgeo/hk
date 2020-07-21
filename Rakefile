desc 'create dissolved polygons'
task :dissolve do
  key = "A45-19_14"
  sh "rm #{key}.geojson" if File.exist?("#{key}.geojson")
  sh "ogr2ogr -a_srs 'EPSG:4326' -lco RFC7946=YES -f GeoJSON #{key}.geojson ~/Downloads/#{key}_GML/#{key}.shp -dialect sqlite -sql 'SELECT ST_Union(Geometry) from \"#{key}\"'"
end
