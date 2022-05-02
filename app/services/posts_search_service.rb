class PostsSearchService
    def self.search(posts, search)
        posts.where("title LIKE '%#{search}%'")
    end
end