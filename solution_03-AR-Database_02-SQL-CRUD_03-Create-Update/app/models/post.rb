class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def save
    @id ? update : insert
  end

  private

  def update
    DB.execute('UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?', @title, @url, @votes, @id)
  end

  def insert
    DB.execute('INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)', @title, @url, @votes)
    @id = DB.last_insert_row_id
  end
end
