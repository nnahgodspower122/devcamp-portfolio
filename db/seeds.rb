
10.times do 
    Blog.create do |blog| 
        title = "My Blog post #{blog}",
        body = "My new blog post is here"
    end
end

5.times do 
    Skill.create do |skill| 
        title = "Rails #{skill}",
        percent_utilized = 15
    end
end

9.times do 
    Portfolio.create do |portfolio_item| 
        title = "Portfolio title: #{portfolio_item}",
        subtitle = "my great service",
        body = "My portfolio details",
        main_image = "http://placehold.it/600x200",
        thumb_image = "http://placehold.it/350x200"
    end
end
