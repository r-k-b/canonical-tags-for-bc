# canonical-tags-for-bc

Get proper `link rel="canonical"` tags for every part of your Business Catalyst site.

status: _incomplete_


## instructions

Copy `canonical-links.tpl` into your site's file structure (I recommend `/_system/apps/site-assets/public/partials/canonical-link.tpl`)

Set up the `site-config.json` file _(docs TBA 😅)_

Add it to each Page Template, with a call like the following:

```
{module_json json="/site-config.json" template="/_system/apps/site-assets/public/partials/canonical-link.tpl" url="{{ url }}"}
```

---

NB: The site will need the Liquid Markup feature to be enabled.
