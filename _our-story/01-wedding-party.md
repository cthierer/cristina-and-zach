---
title: Wedding party
published: false
---
{% assign bridesmaids = site.people | where:"organization","bridesmaids" %}
{% assign groomsmen = site.people | where:"organization","groomsmen" %}
<div class="row wedding-party">
    <div class="col-sm-6 her">
        {% for person in bridesmaids %}
        {% include person.html name=person.title title=person.role bio=person.content img=person.avatar %}
        {% if forloop.last == false %}
        <hr />
        {% endif %}
        {% endfor %}
    </div>
    <hr class="visible-xs-block" />
    <div class="col-sm-6 his">
        {% for person in groomsmen %}
        {% include person.html name=person.title title=person.role bio=person.content img=person.avatar mirror="true" %}
        {% if forloop.last == false %}
        <hr />
        {% endif %}
        {% endfor %}
    </div>
</div>
