SSH='ssh -A -i ~/root/.ssh/id_rsa -l root'

desc "Run puppet on ENV['CLIENT']"
task :apply do
	client = ENV['CLIENT']
	sh "git push"
	sh "#{SSH} #{client} pull-updates"
end
