App = window.App = {}

App.utils =
  successMessage: (message) ->
    return unless message
    M.toast(html: message, classes: 'green')

  errorMessage: (messages) ->
    return unless messages
      for message in messages
        M.toast(html: message, classes: 'red')

$ ->
  App.utils.successMessage(App.flash?.success)
  App.utils.errorMessage(App.flash?.error)
