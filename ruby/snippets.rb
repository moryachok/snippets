require "Mixlib"
cc = Mixlib::ShellOut.new("echo 36")
num_cpus = cc.run_command.stdout.to_i
puts num_cpus
