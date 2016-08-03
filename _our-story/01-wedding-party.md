---
title: Wedding party
lang: en
published: true
---
{% assign bridesmaids = site.people | where:"organization","bridesmaids" | where:"lang",page.lang %}
{% assign groomsmen = site.people | where:"organization","groomsmen" | where:"lang",page.lang %}
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
