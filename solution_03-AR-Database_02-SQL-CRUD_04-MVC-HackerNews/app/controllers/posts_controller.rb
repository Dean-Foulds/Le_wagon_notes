class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    posts = Post.all
    @view.print_posts(posts)
  end

  def create
    title = @view.ask_for_title
    url = @view.ask_for_url
    post = Post.new(title: title, url: url)
    post.save
    @view.print_successfully_created(post)
  end

  def update
    post = find_post
    return unless post
    post.title = @view.ask_for_title
    post.url = @view.ask_for_url
    post.save
    @view.print_successfully_updated(post)
  end

  def destroy
    post = find_post
    return unless post
    post.destroy
    @view.print_successfully_destroyed(post)
  end

  def upvote
    post = find_post
    return unless post
    post.votes += 1
    post.save
    @view.print_successfully_upvoted(post)
  end

  private

  def find_post
    id = @view.ask_for_id
    post = Post.find(id)
    @view.print_post_not_found(id) unless post
    post
  end
end
