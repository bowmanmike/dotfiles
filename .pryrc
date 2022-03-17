def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
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
