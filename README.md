# Patron Theme

![](intro.png)

**Patron** is the theme for [Grav CMS](http://github.com/getgrav/grav). This theme was developed primarily for non-profit organizations, such as Scout organizations. Patron requires a minimum version of Grav 1.7+ and declares compatibility with Grav 2.0.

## Features

- [x] Fully responsive with full-page mobile navigation
- [x] Multiple page template types
- [x] Modular and clean CSS source structure for easy customization
- [x] Robust theme config blueprint
- [x] Configurable color palette presets
- [x] Security Hardened: Conforms to modern context-aware sanitization & Schema.org microdata standards
- [x] Lightweightfootprint: Pruned asset pipeline reducing release bundle bloat by over 12MB

### Supported Page Templates

- Default view template `default.md`
- Modular page view template `modular.md` (replaces legacy landing layout)
- Contacts view template `contacts.md`
- Error view template `error.md`
- Articles list view template `list-articles.md`
- Blog view template `list-gallery.md` (used for image gallery list)
- Gallery view template `gallery.md` (used for image gallery)

## Modular content

The `modular.md` page template renders child pages as typed modules. A module
can declare its type explicitly in the page header:

```yaml
module:
    type: highlights
    items:
        - title: Learn by doing
          text: Practical activities and shared responsibility.
          link: /about
```

The first supported module types are:

- `custom` — general Markdown or custom HTML content.
- `banner` — a simple full-width text banner.
- `image-banner` — a configurable image-backed banner with overlay text,
  buttons and optional parallax scrolling.
- `highlights` — a list of manually configured feature items.
- `groups` — a structured list of groups with age ranges and meeting details.
- `news` — a list of child pages from a configured page path.
- `events` — a manually configured list of events.
- `updates` — an optional two-column news and upcoming-events section.

Events intentionally do not depend on a calendar plugin yet. The event module
uses normalized fields such as `date`, `title`, `time`, `location`, `status` and
`link`. A future calendar integration can provide those same fields without
changing the homepage module or its presentation.

The `groups` module uses manually configured items with fields such as `title`,
`age`, `schedule`, `location`, `text`, `link` and `link_label`. It is intended
for homepage sections that help visitors choose a group or understand when and
where regular meetings take place.

```yaml
module:
    type: groups
    items:
        - title: Younger section
          age: Ages 8–11
          schedule: Wednesdays, 17:30–19:00
          location: Club room
          link: /join
          link_label: How to join
```

The `updates` module combines a short news list with optional manually
configured events. News items published within the configured `recent_days`
window (14 days by default) receive a small `New` marker. The events column
is omitted when no events are configured, so the homepage does not require
manual event maintenance.

The `image-banner` module accepts `image`, `parallax` and a `buttons` list in
its header. Each button uses `label`, `link` and an optional `style` of
`secondary`. Parallax is disabled on small screens and when the visitor prefers
reduced motion.

```yaml
module:
    type: image-banner
    image: /oddil/fotogalerie/2023-07-02-tabor/plate-01.png
    parallax: true
    buttons:
        - label: See our activities
          link: /oddil/oddilove-aktivity
```

Existing modules without `module.type` continue to work based on their page
filename, so `custom.md`, `news.md`, `banner.md` and `form.md` remain valid.

## Article quotations

Articles can use a normal Markdown blockquote. The theme renders it as a
rounded, palette-aware callout:

```markdown
> We learn by doing, and we make room for one another.
```

An HTML `<blockquote>` can be used when an attribution is needed.

# Installation

Installing the Patron theme can be done in one of two ways. The Grav GPM (Grav Package Manager) installation method enables you to quickly and easily install the theme with a simple terminal command, while the manual method enables you to do so via a zip file.

## GPM Installation (Preferred)

The simplest way to install this theme is via the [Grav Package Manager (GPM)](http://learn.getgrav.org/advanced/grav-gpm) through your system's Terminal (also called the command line). From the root of your Grav install type:

    bin/gpm install patron

This will install the Patron theme into your `/user/themes` directory within Grav. Its files can be found under `/your/site/grav/user/themes/patron`.

## Manual Installation

To install this theme, just download the zip version of this repository and unzip it under `/your/site/grav/user/themes`. Then, rename the folder to `patron`. You can find these files either on [GitHub](https://github.com/praserx/grav-theme-patron) or via [GetGrav.org](http://getgrav.org/downloads/themes).

You should now have all the theme files under

    /your/site/grav/user/themes/patron

### Developer Installation & Asset Compilation

If you download or clone this repository directly from GitHub, you **must compile and structure the compiled assets** for the theme styling to render correctly.

Ensure you have [Node.js](https://nodejs.org/) installed, and run the following commands from the root directory of the theme:

```bash
# Install development dependencies
npm install

# Run the asset compiler and organizer
npm run build
```

The script will automatically compile and extract necessary vendor files (such as Bootstrap styling, jQuery, FontAwesome, and Semantic-UI) into the optimized `./assets/` directory.

# Theme configuration

All configuration can be done via the admin interface of Grav. The theme structure utilizes Grav's flexible blueprints to support dynamic overrides.

The Settings tab includes a Color palette selector with four coordinated
presets: Patron blue, Forest and honey, Terracotta and plum, and Slate and
coral. The selected preset controls the theme's page, text, heading, primary,
accent, border, overlay and footer colors.

## Mock skeleton

The repository also contains `skeleton/`, a Grav 2.0 skeleton fixture with the
same Czech page hierarchy as the reference site used during development. Its
copy, dates, contacts, calendar, and gallery entries are deliberately mock
content. The skeleton declares the Patron theme plus the frontend and Grav 2.0
administration plugin dependencies in `skeleton/.dependencies`.

The Helm deployment seeds this complete `skeleton/user` tree by default without
overwriting files already stored on the PVC. Disable it with
`--set skeleton.enabled=false` for a pre-populated site. For a distributable
Grav skeleton, publish `skeleton/` as a separate repository and use the
official Skeleton Builder; the theme itself remains independently installable.

## Security & Performance Hardening

This theme is designed and managed using secure-by-design standards:

- **Output Encoding:** Complete implementation of context-aware Twig escaping filters (e.g., `|e`, `|e('html_attr')`) on all dynamic inputs, including meta tags, contact profiles, footer menus, and user account metadata to absolute block cross-site scripting (XSS).
- **Modern Microdata:** Breadcrumb templates conform to modern Schema.org `BreadcrumbList` standards to achieve optimized SEO parsing, replacing deprecated legacy vocabulary attributes.
- **Lean Asset Pipeline:** Re-engineered developer tasks only stage production minified versions, resulting in over 12MB savings in distribution and server packaging size.

## Your organization settings

```
organization:
  main_contact:
    name: 'Example Organization'
    address: '123 Example Street, Example City, 12345'
    country: 'Example Country'
    email: contact@example.org
  headquarters:
    contacts:
      -
        name: 'Jane Doe'
        nickname: JD
        title: 'Team Leader'
        phone: '+123 456 789'
        email: jane.doe@example.org
        photo: {}
      -
        name: 'John Smith'
        nickname: JS
        title: 'Assistant Leader'
        phone: '+987 654 321'
        email: john.smith@example.org
        photo: {}
  logo:
    user/themes/patron/images/example_logo.png:
      name: example_logo.png
      full_path: example_logo.png
      type: image/png
      size: 123456
      path: user/themes/patron/images/example_logo.png
  background:
    user/themes/patron/images/example_bg.png:
      name: example_bg.png
      type: image/png
      size: 654321
      path: user/themes/patron/images/example_bg.png
  description: 'This is an example description for the organization.'
```

## Socials & Links settings

```
socials:
  facebook: 'https://www.facebook.com/example'
  links:
    'example.com | Example Website': 'https://www.example.com'
    'example.org | Example Organization': 'https://www.example.org'
    'example.net | Example Network': 'https://www.example.net'
```

## Essential settings

```
settings:
  copyright: 'Copy here'
  color_palette: patron
  additional_page_info: 'Additional info here'
  flash_news_path: /path/to/news
  sticky_info: "Landing page short sticky info!"
  favicon:
    user/themes/patron/images/example_favicon.png:
      name: example_favicon.png
      full_path: example_favicon.png
      type: image/png
      size: 12345
      path: user/themes/patron/images/example_favicon.png
  login_link_visible: true
  banner_text: 'Join us every Thursday at 5 PM!'
```

## Modules settings

```
modules:
  news: /example/news
```

# Found a bug?

It is not perfect and there is so much to do. So if you want improve something or if you find a bug, please create new issue.
