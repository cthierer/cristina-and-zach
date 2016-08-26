<cz-guestbook-form>
    <div class="alert alert-danger" role="alert" show={ !submitted && submissionMessage !== '' }>
        { submissionMessage }
    </div>
    <div class="alert alert-success" role="alert" show={ submitted }>
        { submissionMessage }
    </div>
    <div class="alert alert-info" role="alert" show={ pending }>
        { t['please-wait'] }
    </div>
    <div class="alert alert-warning" role="alert" hide={ submitted || Object.keys(validationMessages).length < 1 }>
        <ul>
            <li each={ field,message in validationMessages }>{ message }</li>
        </ul>
    </div>
    <form id="czGuestbookSubmission" novalidate onsubmit={ postMessage } hide={ submitted }>
        <div class="row">
            <div class="col-sm-8">
                <fieldset>
                    <legend class="header sr-only">
                        { t['leave-a-message'] }
                    </legend>
                    <div class="form-group required">
                        <label for="czGuestbookMessage">
                            { t['label-message'] }
                        </label>
                        <textarea id="czGuestbookMessage" name="message"
                            class="form-control" rows="5" required
                            onblur={ validateNotEmpty }
                            maxlength="5000"
                            data-label="{ t['label-message'] }"
                            aria-describedby="czGuestbookMessageHelp"></textarea>
                        <small id="czGuestbookMessageHelp" class="help-block">
                            { t['label-message-help'] }
                        </small>
                    </div>
                </fieldset>
            </div>
            <div class="col-sm-4">
                <fieldset>
                    <legend class="header sr-only">
                        { t['contact-information'] }
                    </legend>
                    <div class="form-group required">
                        <label for="czGuestbookName">
                            { t['label-name'] }
                        </label>
                        <input type="text" id="czGuestbookName"
                            name="author" class="form-control" required
                            onblur={ validateNotEmpty }
                            data-label="{ t['label-name'] }"
                            maxlength="255" />
                    </div>
                    <div class="form-group required">
                        <label for="czGuestbookEmail">
                            { t['label-email'] }
                        </label>
                        <input type="email" id="czGuestbookEmail"
                            name="author_email" class="form-control" required
                            onblur={ validateIsEmail } }
                            data-label="{ t['label-email'] }"
                            maxlength="255" />
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <button class="btn btn-primary btn-lg" type="submit" disabled={ pending || submitted }>
                    { t['label-submit'] }
                </button>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        const VALID_EMAIL = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

        this.t = opts.t
        this.validationMessages = {}
        this.submitted = false
        this.submissionMessage = ''
        this.pending = false

        this.clearValidationMessage = (element) => {
            delete this.validationMessages[element.id]
        }

        this.setValidationMessage = (element, message) => {
            const elementId = element.id
            this.validationMessages[elementId] = message
        }

        this.validateIsEmail = (e) => {
            return this.isValidEmail(e.target)
        }

        this.isValidEmail = (control) => {
            const value = control.value

            if (value && !VALID_EMAIL.test(value)) {
                const label = control.dataset.label
                const message = this.t['validation-email']
                    .replace('\{\{ fieldname \}\}', label || '')
                this.setValidationMessage(control, message)
                return false
            }

            return this.isNotEmpty(control)
        }

        this.validateNotEmpty = (e) => {
            return this.isNotEmpty(e.target)
        }

        this.isNotEmpty = (control) => {
            const value = control.value

            if (!value || value.length < 1) {
                const label = control.dataset.label
                const message = this.t['validation-required']
                    .replace('\{\{ fieldname \}\}', label || '')
                this.setValidationMessage(control, message)
                return false
            }

            this.clearValidationMessage(control)
            return true
        }

        this.isFormValid = () => {
            const hasMessage = this.isNotEmpty(this.czGuestbookMessage)
            const hasName = this.isNotEmpty(this.czGuestbookName)
            const hasEmail = this.isNotEmpty(this.czGuestbookEmail)
            return hasMessage && hasName && hasEmail
        }

        this.postMessage = (e) => {
            if (!this.isFormValid()) {
                return false
            }

            this.pending = true

            const data = {
                message: this.czGuestbookMessage.value,
                author: this.czGuestbookName.value,
                email: this.czGuestbookEmail.value
            }

            const self = this

            $.ajax({
                contentType: 'application/json',
                data: JSON.stringify(data),
                method: 'POST',
                url: 'http://localhost:4000/posts/test',
                crossDomain: true,
                error: () => { self.submissionMessage = self.t['submit-error'] },
                success: () => {
                    self.submitted = true
                    self.submissionMessage = self.t['submit-success']
                },
                complete: () => {
                    this.pending = false
                    self.update()
                }
            })

            return false
        }
    </script>
</cz-guestbook-form>
