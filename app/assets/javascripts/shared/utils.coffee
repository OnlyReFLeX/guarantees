App = window.App = {}

App.utils =
  successMessage: (message) ->
    return unless message
    M.toast(html: message, classes: 'green')

  errorMessage: (messages) ->
    return unless messages
    if Array.isArray(messages)
      for message in messages
        M.toast(html: message, classes: 'red')
    else
      M.toast(html: messages, classes: 'red')
$ ->
  App.utils.successMessage(App.flash?.success)
  App.utils.errorMessage(App.flash?.error)
