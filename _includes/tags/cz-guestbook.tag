<cz-guestbook>
    <h2>{ t['header-sign'] }</h2>
    <p class="lead">{ t['lead-sign'] }</p>
    <cz-guestbook-form t={ opts.t }></cz-guestbook-form>
    <hr />
    <h2>{ t['header-view'] }</h2>
    <div class="row">
        <div class="col-md-8">
            <cz-guestbook-listing t={ opts.t }></cz-guestbook-listing>
        </div>
    </div>
    <script type="text/javascript">
        this.t = opts.t
    </script>
</cz-guestbook>
