desc 'create dissolved polygons'
task :dissolve do
  key = "A45-19_01"
  sh "rm #{key}.geojson" if File.exist?("#{key}.geojson")
  sh "ogr2ogr -a_srs 'EPSG:4326' -lco RFC7946=YES -f GeoJSON #{key}.geojson ~/Downloads/#{key}_GML/#{key}.shp -dialect sqlite -sql 'SELECT ST_Union(Geometry) from \"#{key}\"'"
end

desc 'create ken_all.geojson'
task :ken_all do
  fn = "ken_all.geojson"
  sh "rm #{fn}" if File.exist?(fn)
  list = Dir.glob("A45*")
  list.filter! {|e| File.size(e) != 0}
  sh "ogrmerge.py -single -o #{fn} #{list.join(' ')}"
end
