class window.DateTimePicker

  @init: ->
    today = new Date()
    yesterday = today.setDate(today.getDate() - 1)

    $('.datepicker').datepicker({
      dateFormat: 'dd-mm-yy',
      # beforeShow: function () {
      #   $('#ui-datepicker-div').css('z-index',9999);
      # },
      beforeShowDay: (date) ->
        [date > yesterday]
    })

    $('.timepicker').timepicker({
      step: 15,
      startTime: '09:00'
    })
