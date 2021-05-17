defmodule MijncmdWeb.Resolvers.Posts do
  alias Mijncmd.{
    Post,
    Repo,
    Accounts.User
  }

  import Absinthe.Resolution.Helpers
  import Ecto.Query, warn: false
  import Ecto

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    if user do
      user
      |> build_assoc(:posts)
      |> Post.insert_changeset(args)
      |> Repo.insert()
    end
  end

  def create_post(%Post{} = post, _, %{context: %{loader: loader}}) do
    loader
    |> Dataloader.load(:db, User, post.author_id)
    |> on_load(fn loader ->
      actor =
        loader
        |> Dataloader.get(:db, User, post.author_id)

      author = actor

      {:ok, author}
    end)
  end

  def list_posts(_user, _args, _resolution) do
    posts =
      Post.published()
      |> Post.preload_all()
      |> Repo.all()
      |> Enum.map(fn post ->
        author = User.map_user_avatar_url(post.author)
        Map.merge(post, %{author: author})
      end)
    {:ok, posts}
  end

  def get_post(_, args, %{
    context: %{current_user: current_user}
  }) do
    # post =
    #   Post
    #   # |> Post.by_slug(slug: args[:slug])
    #   |> Repo.get_by(slug: args[:slug])
    #   |> Post.preload_all()
      # |> Enum.map(fn post ->
      #   post_author =
      #     if post.author_id == current_user.id,
      #       do: User.map_user_avatar_url(current_user),
      #       else: User.map_user_avatar_url(post.user)

      #   Map.merge(post, %{
      #     author: post_author
      #   })
      # end)
      post =
        Post.by_slug(args[:slug])
        |> Post.preload_all()
        |> Repo.all()
        |> Enum.map(fn post ->
          author = User.map_user_avatar_url(post.author)
          Map.merge(post, %{author: author})
        end)
      # {:ok, post}

    {:ok, post}
  end

  def getPosts(_, _args, %{
    context: %{current_user: current_user}
  }) do

    query =
      from(post in Mijncmd.Post,
        order_by: [desc: post.inserted_at]
      )
    posts =
      # Post
      Repo.all(query)
      |> Post.preload_all()
      |> Enum.map(fn post ->
        post_author =
          if post.author_id == current_user.id,
            do: User.map_user_avatar_url(current_user),
            else: User.map_user_avatar_url(post.user)
        post = Post.map_post_cover_url(post)
        Map.merge(post, %{
          author: post_author
        })
      end)
    # posts =
    #   Repo.all(query)
    #   |> Enum.map(fn post ->
    #     post_author =
    #       if post.author_id == current_user.id,
    #         do: User.map_user_avatar_url(current_user),
    #         else: User.map_user_avatar_url(post.user)
    #     Post.map_post_cover_url(post)
    #     Map.merge(post, %{
    #       author: post_author
    #     })
    #   end)
    {:ok, posts}
  end
end
