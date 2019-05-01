30.times do |i|
  # ユーザー作る
  user = User.new(
    email: "test#{i}@example.com",
    password: "higashi"
  )
  user.save!
end

titles = ["ドラえもん", "のび太", "しずかちゃん", "スネ夫", "ジャイアン"]
5.times do |i|
  #部屋作る
  title = titles[i]
  description = "#{title}をめでよう-その#{i + 1}"
  10.times do |j|
    uid = (i + 1) * (j + 1) % 30 + 1
    Post.create!(title: title, description: description, user_id: uid)
  end
end

30.times do |i|
  #レビューする
  reviewing = i + 1
  content = "id#{reviewing}のテストレビューです。"
  5.times do |j|
    reviewer = (i + j + 2) % 30 + 1
    Review.create!(reviewer: reviewer, reviewing: reviewing, content: content)
  end
end

30.times do |i|
  #受講する（リレーション）
  user = User.find(i + 1)
  10.times do |j|
    post = Post.find(i + j + 1)
    unless PostUser.where(user_id: user.id, post_id: post.id)
      PostUser.create!(user_id: user.id, post_id: post.id)
    end
    user.attend(post) unless user.attend?(post)
  end
end

