AREAS_NAMES = File.read("#{Rails.root}/config/areas_names.txt").encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').gsub("\r", "").split("\n")
STREAM_NAMES = File.read("#{Rails.root}/config/stream_names.txt").encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').gsub("\r", "").split("\n")
