class window.AppController
  # always put everything inside PhoneGap deviceready
  document.addEventListener "deviceready", ->

    # Make Navigation Bar to appear with a custom title text
    steroids.navigationBar.show { title: "app" }

  @path: ->

  @testPath: () ->
    alert JSON.stringify(steroids.app.path)

  @testUserFilesPath: ->
    alert JSON.stringify(steroids.app.userFilesPath)

  @testAbsolutePath: () ->
    alert JSON.stringify(steroids.app.absolutePath)
