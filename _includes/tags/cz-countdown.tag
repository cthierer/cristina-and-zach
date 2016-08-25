<cz-countdown>
  <p class="countdown" if={ daysRemaining > 0 }>
    { message }
  </p>
  <script>
    var t = {
      en: {
        template: "{{ site.data.contents.en.countdown-format }}",
        day: "{{ site.data.contents.en.day }}",
        days: "{{ site.data.contents.en.days }}"
      },
      es: {
        template: "{{ site.data.contents.es.countdown-format }}",
        day: "{{ site.data.contents.es.day }}",
        days: "{{ site.data.contents.es.days }}"
      }
    }

    function getDaysRemaining (toDate) {
      var date = Date.parse(toDate)
      var today = new Date()
      return Math.ceil((date - today) / 86400000)
    }

    function render (diff, lang) {
      var days = (diff < 2) ? t[lang].day : t[lang].days
      return t[lang].template
        .replace(/\{\{ days \}\}/, days)
        .replace(/\{\{ count \}\}/, diff);
    }

    this.lang = opts.lang || 'en'
    this.daysRemaining = getDaysRemaining(opts.date)
    this.message = render(this.daysRemaining, this.lang)
  </script>
</cz-countdown>
