name "jenkins"
description "jenkins role"
env_run_lists "_default" => [],
              'development' => ['recipe[main]','recipe[jenkins::master]'],
              'production' => ['recipe[main]']