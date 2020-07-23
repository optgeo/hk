require 'find'

desc 'create dissolved polygons'
task :dissolve do
  key = "A45-19_04"
  sh "rm #{key}.geojson" if File.exist?("#{key}.geojson")
  sh "ogr2ogr -a_srs 'EPSG:4326' -lco RFC7946=YES -f GeoJSON #{key}.geojson ~/Downloads/#{key}_GML/#{key}.shp -dialect sqlite -sql 'SELECT ST_Union(Geometry) from \"#{key}\"'"
end

desc 'create ken_all.geojson(s)'
task :ken_all do
  fn = "ken_all.geojson"
  sh "rm #{fn}" if File.exist?(fn)
  list = Dir.glob("A45*")
  list.filter! {|e| File.size(e) != 0}
  sh "ogrmerge.py -single -o #{fn} #{list.join(' ')}"
  sh "ogr2ogr #{fn}s #{fn}"
end

desc 'produce tiles'
task :tiles do
  MAXZOOM = 14
  cmd = "(ruby small.rb ken_all.geojsons; "
  r = []
  Dir.glob("/Users/hfu/Downloads/A45-19_*_GML").each {|path|
    geojson_path = Dir.glob("#{path}/*.geojson")[0]
    r << "(ogr2ogr -f GeoJSONSeq /vsistdout/ #{geojson_path} | ruby filter.rb)"
  }
  cmd += r.join('; ')
  cmd += ") | tippecanoe -o tiles.mbtiles -f --maximum-zoom=#{MAXZOOM} --base-zoom=#{MAXZOOM} --hilbert"
  sh cmd
  sh "tile-join --force --no-tile-compression --output-to-directory=docs/zxy --no-tile-size-limit tiles.mbtiles"
end

desc 'create style.json'
task :style do
  sh "parse-hocon conf/style.conf > docs/style.json"
  sh "gl-style-validate docs/style.json"
end

desc 'host the site locally'
task :host do
  sh "budo -d docs"
end

