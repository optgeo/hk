desc 'create dissolved polygons'
task :dissolve do
  key = "A45-19_02"
  sh "ogr2ogr -progress -f GeoJSON #{key}.geojson ~/Downloads/#{key}_GML/#{key}.shp -dialect sqlite -sql 'SELECT ST_Union(Geometry) from \"#{key}\"'"
end
