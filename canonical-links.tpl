<!--{% comment -%} Call this directly from Page Template scope like so:
 { module_json json="/site-config.json" template="/_System/assets/partials/canonical-link.tpl" url="{{ url }}"}

 Homepage: https://bitbucket.org/snippets/bigbluedigital/7EReM
 
 See also: [site-config.json.md](https://bitbucket.org/snippets/bigbluedigital/8L9ee)
{% endcomment -%}-->

<!--{{ this | json | escape }}-->

{% assign ggidLeadingChar = globals.get.id | truncate: 1, "" -%}
{% assign urlLeadingChar = params.url | truncate: 1, "" -%}
{% assign blogPostId = globals.get.PostID | default: false -%}
{% assign newsPostId = globals.get.ID | default: false -%}
{% if ggidLeadingChar == "/" -%}
    <link rel="canonical" href="{{ primaryOrigin }}{{ globals.get.id | replace_first: '/', '' }}" />
    <!-- Standard pages, ...? -->

{% elsif urlLeadingChar == "/" -%}
    <link rel="canonical" href="{{ primaryOrigin }}{{ params.url | replace_first: '/', '' }}" />
    <!-- Webapp detail views, ...? -->

{% elsif blogPostId -%}
    <link rel="canonical" href="{{ primaryOrigin }}BlogRetrieve.aspx?PostID={{ blogPostId }}" />
    <!-- Blog detail views, ...? -->

{% elsif globals.get.BlogId and globals.get.BlogId != "" -%}
    {module_data resource="blogs" version="v3" fields="blogUrl" resourceId="5473" skip="0" limit="1" order="id" collection="blogCanonical"}
    <link rel="canonical" href="{{ primaryOrigin }}{{ blogCanonical.blogUrl | replace_first: '/', '' }}" />
    <!-- Blog list view (page 1 only), ...? -->

{% elsif newsPostId -%}
    <link rel="canonical" href="{{ primaryOrigin }}AnnouncementRetrieve.aspx?ID={{ newsPostId }}" />
    <!-- News detail views, ...? -->

{% elsif globals.get.ProductID and globals.get.ProductID != "" -%}
    {module_data resource="products" version="v3" fields="absoluteCanonicalUrl" resourceId="{{ globals.get.ProductID }}" skip="0" limit="1" order="id" collection="productCanonical"}
    <link rel="canonical" href="{{ productCanonical.absoluteCanonicalUrl }}" />
    <!-- Ecommerce product detail view, ...? -->

{% elsif globals.get.CatalogueID and globals.get.CatalogueID != "" -%}
    {module_data resource="catalogs" version="v3" fields="url" resourceId="{{ globals.get.CatalogueID }}" skip="0" limit="1" order="id" collection="catalogueCanonical"}
    <link rel="canonical" href="{{ primaryOrigin }}{{ catalogueCanonical.url | replace_first: '/', '' }}" />
    <!-- Ecommerce catalogue view, ...? -->

{% elsif globals.get == empty -%}
    <link rel="canonical" href="{{ primaryOrigin }}" />
    <!-- Homepage, ...? -->

{% endif -%}
<!--{% comment -%} TODO: Event detail views, ...?
{% endcomment -%}-->
