---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
    layout: base
    paginate: 10
    staticpage: true
---
{% include postlist.html post=site.posts %}

{% include pagination.html %}