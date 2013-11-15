@lunchHub.factory "Page", ->
  title = "default"
  title: ->
    title

  setTitle: (newTitle) ->
    title = newTitle
