REPO='https://github.com/Donhyun72/puppet'
SSH='ssh -A -i ~/.ssh/id_rsa -l root'

desc "Add syntax check hook to your git repo"
task :add_check do
	here = File.dirname(__FILE__)
	sh "ln -s #{here}/hooks/check_syntax.sh #{here}/.git/hooks/pre-commit"
	puts "Puppet syntax check hook added"
end

desc "Bootstrap Puppet on ENV['CLIENT'] whth hostname ENV['HOSTNAME']"
task :bootstrap do
	client = ENV['CLIENT']
	hostname = ENV['HOSTNAME'] || client
	commands = <<BOOTSTRAP
hostname #{hostname} && \
echo #{hostname} > /etc/hostname && \
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb && \
dpkg -i puppetlabs-release-precise.deb && \
apt-get update && \
apt-get -y install git puppet && \
cd /vagrant && \
git clone #{REPO} && \
puppet apply --modulepath=/vagrant/puppet/modules /vagrant/puppet/manifests/site.pp
BOOTSTRAP
  sh "git push"
	sh "#{SSH} #{client} '#{commands}'"
end
