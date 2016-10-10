################
# 

################
# 
######
directory "#{node['hello_world_config_path']}" do 
  owner 'jboss' 
  group 'jboss' 
  mode '0755' 
  recursive true 
  action :create 
end

['hello-world-message.txt'].each do |file|
  template "#{node['hello_world_config_path']}#{file}" do
    source "hello-world/#{file}"
    owner "jboss"
    group "jboss"
    mode "0744"
    variables(
      :var => node["hello_world"]
      )
  end
end

remote_directory "#{node['hello_world_config_path']}" do
  source "hello-world"
  #cookbook "default is current"
  files_mode "0744"
  files_owner "jboss"
  files_group "jboss"
  mode "0755"
  owner "jboss"
  group "jboss"
  overwrite true
  recursive true
  action :create
end

