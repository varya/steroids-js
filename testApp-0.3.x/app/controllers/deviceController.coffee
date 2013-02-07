class window.DeviceController

  @testPing: () ->

    gotPong = (e) ->
      alert e.message

    steroids.device.ping({}, { onSuccess: gotPong })


  @testTorchOn: () ->

    steroids.device.torch.turnOn {
    }, {
      onSuccess: () -> alert "turned on"
    }

  @testTorchOff: () ->

    steroids.device.torch.turnOff {
    }, {
      onSuccess: () -> alert "turned off"
    }

  @testTorchToggle: () ->

    steroids.device.torch.toggle {
    }, {
      onSuccess: () -> alert "toggled"
    }