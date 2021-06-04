defmodule Mijncmd.PostCreate do
  alias Mijncmd.{User, Repo, Post, PostLike, PostSkill, PostProduct}
  import Ecto.Query, warn: false

  # ##########################
  # Voor zij die deze code lezen, wil ik mij verontschuldigen
  # Soms begin je ergens aan en heb je op een gegeven moment geen idee
  # meer waar je mee bezig bent, dat moment heb ik ook gehad. Daarom ben
  # ik om de schade te beperken hieraan begonnen. Niet mijn grootste trots
  # maar zolang het werkt ben ik blij. Voor schadevergoeding stuur een mail
  # naar: hallo@nordyvlasman.nl
  #
  # ps: if it looks stupid but it works, it ain't stupid xoxoxo
  # #########################

  # TODO: - Plz make this dynamic Nordy xx Nordy
  def create(%User{} = user, params) do
    params = Map.put(params, :author_id, user.id)

    %Post{}
    |> Post.create_changeset(params)
    |> Repo.insert()

    post = Repo.get_by(Post, slug: params.slug)

    Enum.each(params.skills, fn skill ->
      postSkill = %{post_id: post.id, skill_id: skill}
      %PostSkill{}
      |> PostSkill.create_changeset(postSkill)
      |> Repo.insert()
    end)

    params.products do
      Enum.each(params.products, fn product ->
        postProduct = %{post_id: post.id, product_id: product}
        %PostProduct{}
        |> PostProduct.create_changeset(postProduct)
        |> Repo.insert()
      end)
    end

    {:ok, post}
  end

  def like(%User{} = user, params) do
    exists_query = from(u in PostLike, where: u.post_id == ^params.post_id, where: u.user_id == ^user.id)
    exists = Repo.aggregate(exists_query, :count)

    post = Repo.get(Post, params.post_id)

    case exists do
        0 ->
          count_query = from(u in PostLike, where: u.post_id == ^params.post_id)
          cur_count = Repo.aggregate(count_query, :count)

          new_count = Enum.max([0, cur_count])
          map = Map.put(%{}, :likes_count, new_count + 1)

          params = Map.put(params, :user_id, user.id)

          post
          |> Post.update_changeset(map)
          |> Repo.update()

          %PostLike{}
          |> PostLike.create_changeset(params)
          |> Repo.insert()

          post = Repo.get(Post, params.post_id)

          {:ok, post}
        1 ->
          {:ok, post}
    end
  end

  def dislike(%User{} = user, params) do
    exists_query = from(u in PostLike, where: u.post_id == ^params.post_id, where: u.user_id == ^user.id)
    exists = Repo.aggregate(exists_query, :count)

    post = Repo.get(Post, params.post_id)

    case exists do
        1 ->
          count_query = from(u in PostLike, where: u.post_id == ^params.post_id)
          cur_count = Repo.aggregate(count_query, :count)

          new_count = Enum.max([0, cur_count])
          map = Map.put(%{}, :likes_count, new_count - 1)

          post
          |> Post.update_changeset(map)
          |> Repo.update()

          exists_query |> Repo.delete_all
          post = Repo.get(Post, params.post_id)

          {:ok, post}
        0 ->
          {:ok, post}
    end
  end
end
