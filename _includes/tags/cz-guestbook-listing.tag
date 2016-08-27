<cz-guestbook-listing>
    <div class="listing">
        <div class="alert alert-info" show={ display === false && !error }>
            { t['loading'] }
        </div>
        <div class="alert alert-danger" show={ error !== false }>
            { t['loading-error'] }
        </div>
        <div each={ display } data-is="cz-guestbook-post" t={ t }
            message={ message } author={ author } submitted={ date_submitted }></div>
        <button class="btn btn-primary btn-lg btn-stretch" if={ hasMore() } onclick={ showMore }>
            { t['show-more'] }
        </button>
    </div>
    <script type="text/javascript">
        const PAGE_SIZE = 7

        this.t = opts.t
        this.posts = []
        this.display = false
        this.error = false

        this.hasMore = () => this.display.length < this.posts.length

        this.showMore = () => {
            const startIdx = this.display.length
            const endIdx = startIdx + PAGE_SIZE
            this.display = this.display.concat(this.posts.slice(startIdx, endIdx))
        }

        this.on('before-mount', () => {
            const self = this;

            $.ajax({
                contentType: 'application/json',
                method: 'GET',
                url: 'http://localhost:4000/posts/test',
                crossDomain: true,
                complete: () => {
                    self.update()
                },
                error: () => {
                    this.error = true
                },
                success: (data) => {
                    self.posts = data.posts
                    self.display = self.posts.slice(0, PAGE_SIZE)
                }
            })
        })
    </script>
    <style scoped>
        .listing {
            margin-top: 32px;
        }

        .btn-stretch {
            width: 100%;
        }
    </style>
</cz-guestbook-listing>
