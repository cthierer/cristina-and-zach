<cz-guestbook-post>
    <div class="post" if={ message }>
        <p class="author meta" if={ author }>
            { author } { t['author-says'] }:
        </p>
        <blockquote class="message">
            { message }
        </blockquote>
        <p class="submitted-date meta" if={ submitted }>
            <small>{ submitted }</small>
        </p>
    </div>
    <hr/>
    <script type="text/javascript">
        this.t = opts.t
        this.message = opts.message ? opts.message.trim() : null
        this.author = opts.author ? opts.author.trim() : null
        this.submitted = opts.submitted ? moment(opts.submitted).fromNow() : null
    </script>
    <style scoped>
        .post {
            background-color: #E7DFCD;
            border-radius: 3px;
            border: 1px solid #E7DFCD;
            padding: 15px 20px;
        }

        .post > *:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .message {
            border-left-color: #2D4064;
            background-color: #F8F8F8;
        }
    </style>
</cz-guestbook-post>
