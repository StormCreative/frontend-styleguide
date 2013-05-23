desc "Run unit tests"
task :push do
    system("git add -u")
    system("git add .")
    system("git commit -m 'lazy commit'")
    system('git push origin master')
    message = "Pushed successfully"
    image = ""
    growl_notify(message, image)
end

def growl_notify(message, image="") 
    if !image.nil?
        image = "--image '#{image}'"
    end
    system("growlnotify #{image} -m '#{message}'")
end