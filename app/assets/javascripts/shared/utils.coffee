App = window.App = {}

App.utils =
  successMessage: (message) ->
    return unless message
    M.toast(html: message, classes: 'green')

  errorMessage: (message) ->
    return unless message
    M.toast(html: message, classes: 'red')

$ ->
  App.utils.successMessage(App.flash?.success)
  App.utils.errorMessage(App.flash?.error)
