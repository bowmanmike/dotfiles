def pbcopy(input)
  str = input.to_s
  IO.popen("pbcopy", "w") { |f| f << str }
  str
end

def pbpaste
  `pbpaste`
end

def show_instance_methods(object)
  (object.methods - Object.methods).sort
end

def clear_sidekiq
  require "sidekiq/api"

  Sidekiq::Queue.all.each(&:clear)
  Sidekiq::RetrySet.new.clear
  Sidekiq::ScheduledSet.new.clear
  Sidekiq::DeadSet.new.clear
end

def read_json_file(path)
  require "json"

  full_path = File.join(Dir.getwd, path)
  File.read(full_path).then { |data| JSON.parse(data) }
end
