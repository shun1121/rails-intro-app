#json.array! @intros, partial: "intros/intro", as: :intro


# json.array! @intros, :id, :hometown, :content

json.array! @intros do |intro|
    json.id intro.id
    json.name intro.name
    json.hometown intro.hometown
    json.content intro.content
    json.image intro.image
end