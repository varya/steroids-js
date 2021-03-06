class window.ModalController
  # always put everything inside PhoneGap deviceready
  document.addEventListener "deviceready", ->

    # Make Navigation Bar to appear with a custom title text
    # steroids.navigationBar.show { title: "modal" }

  @testShow: () ->
    opened = () ->
      alert "opened"

    hideView = new steroids.views.WebView {
      location: "/views/modal/hide.html"
    }

    steroids.modal.show {
      view: hideView
    }, {
      onSuccess: opened
    }

  @testShowWithNavBar: () ->
    opened = () ->
      alert "opened"

    hideView = new steroids.views.WebView {
      location: "/views/modal/hide.html"
    }

    steroids.modal.show {
      view: hideView
      hidesNavigationBar: false
    }, {
      onSuccess: opened
    }

  @testOpenAnotherModal: () ->

    steroids.modal.show(new steroids.views.WebView("/views/modal/index.html"))

  @testShowShorthand: () ->

    hideView = new steroids.views.WebView "/views/modal/hide.html"

    steroids.modal.show(hideView)

  @testShowModalWithNavBar: () ->

    modalWithNavBar = new steroids.views.WebView "/views/modal/modalWithNavBar.html"

    steroids.modal.show(modalWithNavBar)

  @testDisplayNavigationBar: () ->
    steroids.view.navigationBar.show
      title: "Modal Title",
      animated: true

    rightButton = new steroids.buttons.NavigationBarButton();

    rightButton.title = "Right"
    rightButton.onTap = => alert('touched Right')

    steroids.view.navigationBar.setButtons {
      right: [rightButton]
    },
    {
      onSuccess: alert "Buttons set!" ;
    }

  @testHideNavigationBar: () ->
    steroids.view.navigationBar.hide()


  @testShowPreloaded: () ->

    window.addEventListener "message", (message) =>
      steroids.modal.show(preloadedView) if message.data == "okay to show modal"


    preloadedView = new steroids.views.WebView "/views/modal/preload.html"
    preloadedView.preload()


  @testShowPreloadedKeepLoading: () ->

    preloadedNowOpenModal = () =>
      setTimeout ->
        steroids.modal.show {
          view: preloadedView
          keepLoading: true
        }
      , 1000

    preloadedView = new steroids.views.WebView "/views/modal/keepLoading.html"
    preloadedView.preload {}, {
      onSuccess: preloadedNowOpenModal
    }


  @testHide: () ->

    hidden = () ->
      # causes the app to crash if closed after 2 seconds.. that is because
      #the source webview where the aler originates is no longer on memory
      #alert "hidden"

    steroids.modal.hide {
    }, {
      onSuccess: hidden
    }
    
  @testCloseAll: () ->
  
    hidden = () ->
      alert "all closed"
  
    steroids.modal.closeAll {
    }, {
      onSuccess: hidden
    }

  @testHideDisableAnimation: () ->

    hidden = () ->
      alert "hidden without animation"

    steroids.modal.hide {
      disableAnimation: true
    }, {
      onSuccess: hidden
    }

  @testShowDisableAnimation: () ->
    opened = () ->
      alert "opened"

    hideView = new steroids.views.WebView {
      location: "/views/modal/hide.html"
    }

    steroids.modal.show {
      view: hideView
      disableAnimation: true
    }, {
      onSuccess: opened
    }

  @testUpdateNavBar: ->
    closeButton = new steroids.buttons.NavigationBarButton
    closeButton.title = "Close"
    closeButton.onTap = => steroids.modal.hide()

    steroids.view.navigationBar.update {
      titleImagePath: "/icons/telescope@2x.png"
      buttons: {
        right: [closeButton]
      }
    },
      onSuccess: -> alert "nav bar buttons updated"
      onFailure: -> alert "failed to update nav bar buttons"

  @testSetAppearanceToRainbow: ->
    steroids.view.navigationBar.setAppearance {
      tintColor: '#FF0000'
      titleTextColor: '#0000FF'
      buttonTintColor: '#00FF00'
      buttonTitleTextColor: '#FF7F00'
      portraitBackgroundImage: steroids.app.path + '/images/navbar-bg@2x.png'
      landscapeBackgroundImage: steroids.app.path + '/images/navbar-bg@2x.png'
    }, {
      onSuccess: -> alert "taste the rainbow"
      onFailure: -> alert "failed set nav bar appearance"
    }

  #event tests

  @testWillShowChangeEvent: ->
    eventHandler = steroids.modal.on 'willshow', (event) ->
      alert "willshow event -> eventName: #{event.name} target.webview.id: #{event.target.webview.id}"

    alert "event listener added"

  @testDidShowChangeEvent: ->
    eventHandler = steroids.modal.on 'didshow', (event) ->
      alert "didshow event -> eventName: #{event.name} target.webview.id: #{event.target.webview.id}"

    alert "event listener added"

  @testWillCloseChangeEvent: ->
    eventHandler = steroids.modal.on 'willclose', (event) ->
      alert "willclose event -> eventName: #{event.name} target.webview.id: #{event.target.webview.id}"

    alert "event listener added"

  @testDidCloseChangeEvent: ->
    eventHandler = steroids.modal.on 'didclose', (event) ->
      alert "didclose event -> eventName: #{event.name} target.webview.id: #{event.target.webview.id}"

    alert "event listener added"

  @testRemoveShowEvents: ->
    steroids.modal.off 'willshow'
    steroids.modal.off 'didshow'

    alert "modal show events handlers removed"

  @testRemoveCloseEvents: ->
    steroids.modal.off 'willclose'
    steroids.modal.off 'didclose'

    alert "modal close events handlers removed"

  @testGetApplicationState: ->
    steroids.getApplicationState {}
    ,
      onSuccess: (appState) ->
        alert "application state received :-)"
